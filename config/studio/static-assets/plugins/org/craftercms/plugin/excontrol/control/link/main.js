/*
 * Copyright (C) 2007-2022 Crafter Software Corporation. All Rights Reserved.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as published by
 * the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

CStudioForms.Controls.Link =
  CStudioForms.Controls.Link ||
  function (id, form, owner, properties, constraints, readonly) {
    this.owner = owner;
    this.owner.registerField(this);
    this.errors = [];
    this.properties = properties;
    this.constraints = constraints;
    this.inputEl = null;
    this.displayTxtEl = null;
    this.patternErrEl = null;
    this.required = false;
    this.value = '_not-set';
    this.form = form;
    this.datasources = null;
    this.urlPath = '';
    this.id = id;
    this.fileData = null;
    this.readonly = readonly;
    this.hiddenEl = null;
    this.linkText = '';
    this.linkTarget = '';
    this.taxKey = '';
    this.taxValue = '';
    this.url = '';
    this.linkTitle = '';
    this.supportedPostFixes = ['_o'];

    this.formatMessage = CrafterCMSNext.i18n.intl.formatMessage;
    this.words = CrafterCMSNext.i18n.messages.words;
    this.messages = CrafterCMSNext.i18n.messages.rteControlMessages;

    const emotion = craftercms.libs.createEmotion({ key: 'tekcent-link' })
    const stylesheet = {
      toxTextFieldListboxField: emotion.css({ 
        '-webkit-appearance': 'none',
        '-moz-appearance': 'none',
        'appearance': 'none',
        'background-color': '#fff',
        'border-color': '#ccc',
        'border-radius': '3px',
        'border-style': 'solid',
        'border-width': '1px',
        'box-shadow': 'none',
        'box-sizing': 'border-box',
        'color': '#222f3e',
        'font-family': '-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Oxygen-Sans,Ubuntu,Cantarell,"Helvetica Neue",sans-serif',
        'font-size': '16px',
        'line-height': '24px',
        'margin': '0',
        'min-height': '34px',
        'outline': '0',
        'padding': '5px 4.75px',
        'resize': 'none',
        'width': '100%'
       }),
      toxDialogFooter: emotion.css({
        'align-items': 'center',
        'background-color': '#fff',
        'border-top': '1px solid #ccc',
        'display': 'flex',
        'justify-content': 'space-between',
        'padding': '8px 16px'
       }),
       toxFormControlsHStack : emotion.css({
        'align-items': 'center',
        'display': 'flex'
      }),
      toxControlWrapStatusIconWrap: emotion.css({
        'position': 'absolute',
        'top': '50%',
        'transform': 'translateY(-50%)',
        'right': '4px'
      }),
      toxDropdown: emotion.css({
        'border-radius': '3px',
        'border-width': '1px',
        'width': '100%',
        'line-height': '24px',
        'font-size': '16px',
        'border-color': '#ccc',
        'border-style': 'solid',
        'box-sizing': 'border-box',
        'min-height': '34px',
        'padding' : '5px 4.75px'
      }),
      toxLabel: emotion.css({
        'color': 'rgba(34,47,62,.7)',
      }),
    };

    this.stylesheet = stylesheet;

    /*
    const emotion = craftercms.libs.createEmotion({ key: 'tekcent-link' })
    const stylesheet = {
      toxform__groupX: emotion.css({ border: '1px solid #ccc' }),
      toxtextfieldXX: emotion.css({ 'box-sizing': 'border-box' })
    };

    this.stylesheet = stylesheet;*/

    //const toxtextfieldXX = '{box-sizing: border-box}';

    amplify.subscribe('/datasource/loaded', this, this.onDatasourceLoaded);
    /*Loader.addModule({
      type: 'css',
      name: 'jquery-datetimepicker-css',
      path: 'libs/datetimepicker/jquery.datetimepicker.css',
      requires: emptyArray
    });
    */


    return this;
  };

YAHOO.extend(CStudioForms.Controls.Link, CStudioForms.CStudioFormField, {
  getLabel: function () {
    return "Link";
  },

  _onChange: function (evt, obj) {
    this.value = [];

    if (obj.inputEl.value != "") {
      var valObj = {};
      valObj.url = obj.inputEl.value;
      valObj.linkText = obj.displayTxtEl.innerHTML;
      valObj.linkTitle = obj.linkTitle;
      valObj.linkTarget = obj.linkTarget;
      valObj.taxKey = obj.taxKey;
      valObj.taxValue = obj.taxValue;

      if (valObj.taxKey != "")
        valObj.linkText = valObj.taxValue;

      this.value.push(valObj);
    }

    var validationExist = false;
    var validationResult = true;
    if (obj.required) {
      if (obj.inputEl.value == '') {
        obj.setError('required', 'Field is Required');
        validationExist = true;
        validationResult = false;
      } else {
        obj.clearError('required');
      }
    } else {
      var id = obj.id;
      if (obj.inputEl.value != '') {
        var fields = obj.owner.fields.forEach(function (item) {
          var el = item;
          var properties = item.properties.forEach(function (prop) {
            if (prop.name == 'depends') {
              if (id.includes(prop.value) && prop.value != '' && el.value == '_blank') {
                el.required = true;
                el.setError('required', 'Field is Required');
                el.renderValidation(true, false);
                var constraints = el.constraints.forEach(function (constr) {
                  if (constr.name == 'required') {
                    constr.value = 'true';
                  }
                });
              }
            }
          });
        });
      } else {
        var fields = obj.owner.fields.forEach(function (item) {
          var el = item;
          var properties = item.properties.forEach(function (prop) {
            if (prop.name == 'depends') {
              if (id.includes(prop.value) && prop.value != '') {
                el.required = false;
                el.clearError('required');
                el.renderValidation(false, false);
                var constraints = el.constraints.forEach(function (constr) {
                  if (constr.name == 'required') {
                    constr.value = 'false';
                  }
                });
              }
            }
          });
        });
      }
    }

    if ((!validationExist && obj.inputEl.value != '') || (validationExist && validationResult)) {
      for (var i = 0; i < obj.constraints.length; i++) {
        var constraint = obj.constraints[i];
        if (constraint.name == 'pattern') {
          var regex = constraint.value;
          if (regex != '') {
            if (obj.inputEl.value.match(regex)) {
              // only when there is no other validation mark it as passed
              obj.clearError('pattern');
              YAHOO.util.Dom.removeClass(obj.patternErrEl, 'on');
              validationExist = true;
            } else {
              if (obj.inputEl.value != '') {
                YAHOO.util.Dom.addClass(obj.patternErrEl, 'on');
              }
              obj.setError('pattern', 'The value entered is not allowed in this field.');
              validationExist = true;
              validationResult = false;
            }
          }

          break;
        }
      }
    }

    // actual validation is checked by # of errors
    // renderValidation does not require the result being passed
    obj.renderValidation(validationExist, validationResult);
    obj.owner.notifyValidation();
    obj.form.updateModel(obj.id, obj.getValue());

    this.hiddenEl.value = this.valueToString();
  },

  _onChangeVal: function (evt, obj) {
    obj.edited = true;
    this._onChange(evt, obj);
  },

  onDatasourceLoaded: function (data) {
    if (this.datasourceName === data.name && !this.datasource) {
      var datasource = this.form.datasourceMap[this.datasourceName];
      this.datasource = datasource;
      datasource.getList(this.callback);
    }
  },

  render: function (config, containerEl) {
    // we need to make the general layout of a control inherit from common
    // you should be able to override it -- but most of the time it wil be the same
    containerEl.id = this.id;
    this.containerEl = containerEl;
    this.config = config;

    var _self = this;

    var titleEl = document.createElement('span');

    YAHOO.util.Dom.addClass(titleEl, 'cstudio-form-field-title');
    titleEl.textContent = config.title;

    var controlWidgetContainerEl = document.createElement('div');
    
    var validEl = document.createElement('span');
    YAHOO.util.Dom.addClass(validEl, 'validation-hint');
    YAHOO.util.Dom.addClass(validEl, 'cstudio-form-control-validation fa fa-check');
    controlWidgetContainerEl.appendChild(validEl);

    var editDivEl = document.createElement('div');
    YAHOO.util.Dom.addClass(editDivEl, 'cstudio-form-control-filename-edit');
    controlWidgetContainerEl.appendChild(editDivEl);
    
    var editEl = document.createElement('input');
    this.editEl = editEl;
    YAHOO.util.Dom.addClass(editEl, 'btn btn-default btn-sm cstudio-button');
    editEl.type = 'button';
    editEl.value = 'Insert Link';
    editEl.style.padding = '1px 5px';
    editEl.style.marginLeft = '5px';
    editEl.style.minWidth = '0px';

    editDivEl.appendChild(editEl);

    var inputContainerDivEl = document.createElement('div');
    YAHOO.util.Dom.addClass(inputContainerDivEl, 'cstudio-form-control-file-name-container');
    controlWidgetContainerEl.appendChild(inputContainerDivEl);

    var hiddenEl = document.createElement('input');
    hiddenEl.type = 'hidden';
    YAHOO.util.Dom.addClass(hiddenEl, 'datum');
    inputContainerDivEl.appendChild(hiddenEl);
    this.hiddenEl = hiddenEl;

    var inputDivEl = document.createElement('div');
    YAHOO.util.Dom.addClass(inputDivEl, 'cstudio-form-control-input-container no-wrap input-wrapper disabled');
    inputDivEl.setAttribute('style','border-radius: 4px 4px 0 0; border-bottom: 0');
    inputContainerDivEl.appendChild(inputDivEl);

    var inputEl = document.createElement('input');
    this.inputEl = inputEl;
    this.inputEl.id = "url"
    this.inputEl.disabled = true;
    this.inputEl.maxlength = 250;
    //YAHOO.util.Dom.addClass(inputEl, 'datum');
    YAHOO.util.Dom.addClass(inputEl, 'cstudio-form-control-input cstudio-form-control-file-name');
    inputEl.setAttribute('style','width: 100%');
    inputEl.value = (this.value = '_not-set') ? config.defaultValue : this.value;
    inputDivEl.appendChild(inputEl);

    var displayTxtEl = document.createElement('div');
    this.displayTxtEl = displayTxtEl;
    this.displayTxtEl.id = "displayTxt"
    this.displayTxtEl.disabled = true;
    this.displayTxtEl.setAttribute('style','padding: 5px 10px; width: 100%;display: flex;background: #fafafa;border: 1px solid #ced4da;border-radius: 0 0 4px 4px;align-items: center;');
    this.displayTxtEl.innerHTML = "&nbsp;";
    //var txt = document.createTextNode("-");
    //this.displayTxtEl.appendChild(txt)
    inputContainerDivEl.appendChild(displayTxtEl);

    YAHOO.util.Event.on(
      inputEl,
      'focus',
      function (evt, context) {
        context.form.setFocusedField(context);
      },
      this
    );

    YAHOO.util.Event.on(inputEl, 'change', this._onChangeVal, this);
    YAHOO.util.Event.on(inputEl, 'blur', this._onChange, this);

    this.renderHelp(config, controlWidgetContainerEl);

    containerEl.appendChild(titleEl);
    containerEl.appendChild(controlWidgetContainerEl);

    YAHOO.util.Event.addListener(editEl, 'click', this.createDialog, this, true);

    for (var i = 0; i < config.properties.length; i++) {
      var prop = config.properties[i];

      if (prop.name == 'datasource') {
        //this.datasourceName = prop.value && prop.Value != '' ? prop.value : null;
        if (prop.value && prop.value != '') {
          this.datasourceName = Array.isArray(prop.value) ? prop.value[0] : prop.value;
          this.datasourceName = this.datasourceName.replace('["', '').replace('"]', '');
        }
      }

      if (prop.name == 'readonly' && prop.value == 'true') {
        this.readonly = true;
      }
    }

    if (this.readonly)
      editEl.style.display = 'none';

    if (this.value === '_not-set' || this.value === '') {
      this.value = {};
    }
  },

  addManagedFile(datasource, cb) {
    if (datasource && datasource.add) {
      var self = this;
      datasource.add(
        {
          insertItem: function (fileData) {
            var inputEl = YDom.get('form-field_url');
            inputEl.value =fileData;
          },
          failure: function (message) {
            CStudioAuthoring.Operations.showSimpleDialog(
              'message-dialog',
              CStudioAuthoring.Operations.simpleDialogTypeINFO,
              CMgs.format(langBundle, 'notification'),
              message,
              null,
              YAHOO.widget.SimpleDialog.ICON_BLOCK,
              'studioDialog'
            );
          }
        },
        false
      );
    }
  },

  getValue: function () {
    return this.value;
  },

  setValue: function (value) {
    this.inputEl.value = value[0].url;
    this.displayTxtEl.innerHTML = (value[0].linkText === "") ? "&nbsp;" : value[0].linkText;
    this.inputEl.setAttribute('data-title', value[0].linkTitle);
    this.inputEl.setAttribute('data-target', value[0].linkTarget);
    this.inputEl.setAttribute('data-text', value[0].linkText);
    this.inputEl.setAttribute('data-taxKey', value[0].taxKey);
    this.inputEl.setAttribute('data-taxValue', value[0].taxValue);

    if (value[0].taxKey != "")
    this.displayTxtEl.innerHTML = value[0].taxValue;

    if (value === '') {
      value = [];
    } else if (typeof value === 'string') {
      try {
        value = JSON.parse(value);
      } catch (err) {
        console.log(err);
      }
    }

    this.value = value;
    this.form.updateModel(this.id, this.getValue());
  },

  valueToString: function () {
    var value = this.getValue();

    var strValue = '[';
    var values = this.getValue();
    var item = null;
    if (values === '') values = [];

    for (var i = 0; i < values.length; i++) {
      item = values[i];
      strValue += '{ "url": "' + item.url + '", "text": "' + item.linkText + '", "title": "' + item.linkTitle + '", "target": "' + item.linkTarget + '", "taxKey": "' + item.taxKey + '", "taxValue": "' + item.taxValue + '"}';
      if (i != values.length - 1) {
        strValue += ',';
      }
    }

    strValue += ']';

    return strValue;
  },
  
  getName: function () {
    return 'link';
  },

  getSupportedProperties: function () {
    return [
      {
        label: CMgs.format(langBundle, 'displaySize'),
        name: 'size',
        type: 'int',
        defaultValue: '50'
      },
      {
        label: CMgs.format(langBundle, 'maxLength'),
        name: 'maxlength',
        type: 'int',
        defaultValue: '50'
      },
      { label: CMgs.format(langBundle, 'readonly'), name: 'readonly', type: 'boolean' },
      { label: 'Tokenize for Indexing', name: 'tokenize', type: 'boolean', defaultValue: 'false' },
      { label: CMgs.format(langBundle, 'File Manager'), name: 'datasource', type: 'datasource:item' }
    ];
  },

  getSupportedConstraints: function () {
    return [
      { label: CMgs.format(langBundle, 'required'), name: 'required', type: 'boolean' },
      { label: CMgs.format(langBundle, 'matchPattern'), name: 'pattern', type: 'string' }
    ];
  },

  getSupportedPostFixes: function getSupportedPostFixes() {
    return this.supportedPostFixes;
  },

  /**
   * create dialog
   */
  createDialog: function () {
    YDom.removeClass('insertLink-dialog');

    var newdiv = YDom.get('insertLink-dialog');

    if (newdiv == undefined) {
      newdiv = document.createElement('div');
      document.body.appendChild(newdiv);
    }

    var divIdName = 'insertLink-dialog';
    newdiv.setAttribute('id', divIdName);
    newdiv.setAttribute('style', 'position: relative;padding-bottom:5px');
    newdiv.setAttribute('class', 'toxX'); //this.stylesheet.tox

    /****/
    var panelDiv = document.createElement('div');
    panelDiv.setAttribute('style', 'visibility: inherit;width: 480px');
    panelDiv.id = "panel1";
    newdiv.appendChild(panelDiv);

    var dialogContainerlDiv = document.createElement('div');
    dialogContainerlDiv.setAttribute('role', 'dialog');
    dialogContainerlDiv.setAttribute('aria-modal', 'true');
    dialogContainerlDiv.setAttribute('class', 'link-dialog-container');
    dialogContainerlDiv.setAttribute('style', 'position: relative');
    panelDiv.appendChild(dialogContainerlDiv);  

    var wrapperDiv = document.createElement('div');
    wrapperDiv.setAttribute('class', 'wrapper');
    wrapperDiv.setAttribute('style', 'margin:25px');
    dialogContainerlDiv.appendChild(wrapperDiv);      

    var formDiv = document.createElement('div');
    formDiv.setAttribute('class', 'insertLink-form');
    wrapperDiv.appendChild(formDiv);    

    var formGroupDiv = document.createElement('div');
    formGroupDiv.setAttribute('class', 'tox-form__group');
    formGroupDiv.setAttribute('style', 'margin-bottom:5px; box-sizing:border-box');
    formGroupDiv.setAttribute('aria-disabled', 'false');
    formDiv.appendChild(formGroupDiv);  

    var urlLabel = document.createElement('label');
    urlLabel.setAttribute('class', this.stylesheet.toxLabel);
    urlLabel.setAttribute('for', 'form-field_url');
    urlLabel.value = "URL";
    formGroupDiv.appendChild(urlLabel);  
  
    var formControlsHStack = document.createElement('div');
    formControlsHStack.setAttribute('class', this.stylesheet.toxFormControlsHStack);
    formGroupDiv.appendChild(formControlsHStack);  

    var formControlWrap = document.createElement('div');
    formControlWrap.setAttribute('class', 'tox-control-wrap');
    formControlWrap.setAttribute('style', 'flex:1; position:relative');
    formControlWrap.setAttribute('aria-disabled', 'false');
    formControlsHStack.appendChild(formControlWrap);  
    
    var urlField = document.createElement('input');
    urlField.setAttribute('type', 'url');
    urlField.setAttribute('aria-errormessage', 'aria-invalid_526777492591703822075552');
    urlField.setAttribute('role', 'combobox');
    urlField.setAttribute('aria-autocomplete', 'list');
    urlField.setAttribute('aria-haspopup', 'true');
    urlField.setAttribute('aria-expanded', 'false');
    urlField.setAttribute('class', this.stylesheet.toxTextFieldListboxField); //'tox-textfield'
    urlField.id = 'form-field_url';
    formControlWrap.appendChild(urlField);

    var controlIconWrapDiv = document.createElement('div');
    controlIconWrapDiv.setAttribute('class', this.stylesheet.toxControlWrapStatusIconWrap);
    formControlWrap.appendChild(controlIconWrapDiv);  

    var invalIconDiv = document.createElement('div');
    invalIconDiv.setAttribute('title', 'invalid');
    invalIconDiv.setAttribute('class', 'tox-control-wrap__status-icon-wrap');
    invalIconDiv.setAttribute('aria-live', 'polite');
    invalIconDiv.setAttribute('class', 'tox-icon tox-control-wrap__status-icon-invalid');
    invalIconDiv.setAttribute('style', 'display:none');
    invalIconDiv.id = 'aria-invalid_526777492591703822075552';
    invalIconDiv.innerHTML = '<svg width="24" height="24"><path d="M19.8 18.3c.2.5.3.9 0 1.2-.1.3-.5.5-1 .5H5.2c-.5 0-.9-.2-1-.5-.3-.3-.2-.7 0-1.2L11 4.7l.5-.5.5-.2c.2 0 .3 0 .5.2.2 0 .3.3.5.5l6.8 13.6zM12 18c.3 0 .5-.1.7-.3.2-.2.3-.4.3-.7a1 1 0 00-.3-.7 1 1 0 00-.7-.3 1 1 0 00-.7.3 1 1 0 00-.3.7c0 .3.1.5.3.7.2.2.4.3.7.3zm.7-3l.3-4a1 1 0 00-.3-.7 1 1 0 00-.7-.3 1 1 0 00-.7.3 1 1 0 00-.3.7l.3 4h1.4z" fill-rule="evenodd"></path></svg>';
    controlIconWrapDiv.appendChild(invalIconDiv);  

    'tox-button tox-button--icon tox-button--naked tox-browse-url btn-default yui-button'

    var optionBtn = document.createElement('button');
    optionBtn.setAttribute('title', 'URL');
    optionBtn.setAttribute('type', 'button');
    optionBtn.setAttribute('class', 'tox-button tox-button--icon btn-default yui-button');
    optionBtn.setAttribute('style', 'margin-left: 4px; padding: 4px; box-shadow: none');
    optionBtn.id = 'optionButton';
    formControlsHStack.appendChild(optionBtn); 

    var iconSpan = document.createElement('span');
    iconSpan.setAttribute('class', 'tox-icon tox-tbtn__icon-wrap');
    iconSpan.innerHTML = '<svg width="24" height="24"><path d="M19 4a2 2 0 012 2v12a2 2 0 01-2 2h-4v-2h4V8H5v10h4v2H5a2 2 0 01-2-2V6c0-1.1.9-2 2-2h14zm-8 9.4l-2.3 2.3a1 1 0 11-1.4-1.4l4-4a1 1 0 011.4 0l4 4a1 1 0 01-1.4 1.4L13 13.4V20a1 1 0 01-2 0v-6.6z" fill-rule="nonzero"></path></svg>';
    iconSpan.setAttribute('style', 'margin: 0');
    optionBtn.appendChild(iconSpan);

    var simpleDiv = document.createElement('div');
    simpleDiv.setAttribute('class', 'tox-form__group');
    simpleDiv.setAttribute('aria-disabled', 'false');
    simpleDiv.setAttribute('style', 'margin-bottom:5px; box-sizing:border-box');
    formDiv.appendChild(simpleDiv);

    linkTextLabel = document.createElement('label');
    linkTextLabel.setAttribute('class', this.stylesheet.toxLabel);
    linkTextLabel.setAttribute('for', 'form-field_linkText');
    linkTextLabel.innerHTML = "Text to display";
    simpleDiv.appendChild(linkTextLabel); 

    var linkTextField = document.createElement('input');
    linkTextField.setAttribute('type', 'text');
    linkTextField.setAttribute('class', this.stylesheet.toxTextFieldListboxField); //'tox-textfield'
    linkTextField.id = 'form-field_linkText';
    simpleDiv.appendChild(linkTextField); 

    var simpleDivForSelectGroup = document.createElement('div');
    simpleDivForSelectGroup.setAttribute('class', 'tox-form__group');
    simpleDivForSelectGroup.setAttribute('aria-disabled', 'false');
    formGroupDiv.setAttribute('style', 'margin-bottom:5px; box-sizing:border-box');
    formDiv.appendChild(simpleDivForSelectGroup);

    var taxTextLabel = document.createElement('label');
    taxTextLabel.setAttribute('class', this.stylesheet.toxLabel);
    taxTextLabel.setAttribute('for', 'form-field_linkText');
    taxTextLabel.innerHTML = "Text from Taxonomy";
    simpleDivForSelectGroup.appendChild(taxTextLabel); 

    var dropdownTaxContainerDiv = document.createElement('div');
    dropdownTaxContainerDiv.setAttribute('class', 'cstudio-form-control-dropdown-container');
    dropdownTaxContainerDiv.setAttribute('style', 'padding-top:0px');
    simpleDivForSelectGroup.appendChild(dropdownTaxContainerDiv);

    var labelFromTaxEl = document.createElement('select');
    this.labelFromTaxEl = labelFromTaxEl;
    labelFromTaxEl.setAttribute('class', 'datum');
    labelFromTaxEl.setAttribute('class', 'cstudio-form-control-dropdown');
    labelFromTaxEl.setAttribute('class', this.stylesheet.toxDropdown);
    labelFromTaxEl.disabled = true;
    labelFromTaxEl.id = 'form-field_labelFromTax';
    dropdownTaxContainerDiv.appendChild(labelFromTaxEl); 

    var keyValueList = null;
    var taxHolder;
    
    var cb = {
      success: function (list) {
        keyValueList = list;

        if (keyValueList) {
          var blankOption = document.createElement('option');
          //blankOption.setAttribute('class', 'hide');
          blankOption.value = '';
          labelFromTaxEl.disabled = false;
          labelFromTaxEl.appendChild(blankOption);    

          for (var j = 0; j < keyValueList.length; j++) {
            var item = keyValueList[j];
            var optionEl = document.createElement('option');
            optionEl.text =
              item.value ||
              item.value_f ||
              item.value_smv ||
              item.value_imv ||
              item.value_fmv ||
              item.value_dtmv ||
              item.value_htmlmv;
            optionEl.value = item.key;
            labelFromTaxEl.appendChild(optionEl);
          }
        }
      }
    }

    var dataSourceNames = [], datasources = [];

    if (this.datasourceName)
      dataSourceNames = this.datasourceName.split(',');
  
    for (var x = 0; x < dataSourceNames.length; x++) {
      var currentDatasource = this.form.datasourceMap[dataSourceNames[x]];
      datasources.push(currentDatasource);
  
      if (currentDatasource && currentDatasource.list && (currentDatasource.list.length > 0)) {
        currentDatasource.getList(cb);
      }
    }
  
    var datasource = datasources[0];
    if (datasource) {
      this.datasource = datasource;
    } else {
      this.callback = cb;
    }

    simpleDiv = document.createElement('div');
    simpleDiv.setAttribute('class', 'tox-form__group');
    simpleDiv.setAttribute('aria-disabled', 'false');
    simpleDiv.setAttribute('style', 'margin-bottom:5px; box-sizing:border-box');
    formDiv.appendChild(simpleDiv);

    var linkTitleLabel = document.createElement('label');
    linkTitleLabel.setAttribute('class', this.stylesheet.toxLabel);
    linkTitleLabel.setAttribute('for', 'form-field_linkTitle');
    linkTitleLabel.innerHTML = "Title";
    simpleDiv.appendChild(linkTitleLabel)

    var linkTitleField = document.createElement('input');
    linkTitleField.setAttribute('type', 'text');
    linkTitleField.setAttribute('class', this.stylesheet.toxTextFieldListboxField); //'tox-textfield'
    linkTitleField.id = 'form-field_linkTitle';
    simpleDiv.appendChild(linkTitleField); 

    simpleDivForSelectGroup = document.createElement('div');
    simpleDivForSelectGroup.setAttribute('class', 'tox-form__group');
    simpleDivForSelectGroup.setAttribute('aria-disabled', 'false');
    formDiv.appendChild(simpleDivForSelectGroup);

    var linkTargetLabel = document.createElement('label');
    linkTargetLabel.setAttribute('class', this.stylesheet.toxLabel);
    linkTargetLabel.setAttribute('for', 'form-field_1211068102191703822078254');
    linkTargetLabel.innerHTML = "Open link in...";
    simpleDivForSelectGroup.appendChild(linkTargetLabel)

    var listboxDiv = document.createElement('div');
    //listboxDiv.setAttribute('class', 'tox-listboxfield'); //this.stylesheet.toxTextFieldListboxField
    simpleDivForSelectGroup.appendChild(listboxDiv);

    var dropdownContainerDiv = document.createElement('div');
    dropdownContainerDiv.setAttribute('class', 'cstudio-form-control-dropdown-container');
    dropdownContainerDiv.setAttribute('style', 'padding-top:0px; padding-bottom:5px');
    listboxDiv.appendChild(dropdownContainerDiv);
    
    var selectControl = document.createElement('select');
    selectControl.setAttribute('class', 'datum cstudio-form-control-dropdown');
    selectControl.setAttribute('class', this.stylesheet.toxDropdown);
    selectControl.id = 'form-field_linkTarget';
    dropdownContainerDiv.appendChild(selectControl);     

    var option1 = document.createElement('option');
    option1.setAttribute('class', 'hide');
    selectControl.appendChild(option1);    

    var option2 = document.createElement('option');    
    option2.setAttribute('value', 'Self');
    option2.innerHTML = 'Current window';
    selectControl.appendChild(option2);    
    
    var option3 = document.createElement('option');    
    option3.setAttribute('value', 'New');
    option3.innerHTML = 'New window';
    selectControl.appendChild(option3);  
    
    var footerDiv = document.createElement('div');
    footerDiv.setAttribute('class', this.stylesheet.toxDialogFooter); //'tox-dialog__footer'
    dialogContainerlDiv.appendChild(footerDiv);

    var footerStartDiv = document.createElement('div');
    footerStartDiv.setAttribute('role', 'presentation');
    footerStartDiv.setAttribute('class', 'tox-dialog__footer-start');
    footerDiv.appendChild(footerStartDiv);
    
    var footerEndDiv = document.createElement('div');
    footerEndDiv.setAttribute('role', 'presentation');
    footerEndDiv.setAttribute('class', 'tox-dialog__footer-end');
    footerDiv.appendChild(footerEndDiv);

    var cancelBtn = document.createElement('button');
    cancelBtn.setAttribute('title', 'Cancel');
    cancelBtn.setAttribute('type', 'button');  
    cancelBtn.setAttribute('class', 'cstudio-xform-button btn btn-default');
    cancelBtn.setAttribute('style', 'min-width: 88px; margin-left: 8px; padding: 6px 12px');
    cancelBtn.innerText = 'Cancel';
    cancelBtn.id = 'dndCancelButton';
    footerEndDiv.appendChild(cancelBtn);

    var insertBtn = document.createElement('button');
    insertBtn.setAttribute('title', 'Insert');
    insertBtn.setAttribute('type', 'button');  
    insertBtn.setAttribute('class', 'cstudio-xform-button btn btn-primary');
    insertBtn.setAttribute('style', 'min-width: 88px; margin-left: 8px; padding: 6px 12px');
    insertBtn.innerText = 'Insert';
    insertBtn.id = 'dndInsertButton';
    footerEndDiv.appendChild(insertBtn);
  
    /******/

    /*newdiv.innerHTML =
    '<div id="panel1" style="visibility: inherit;width: 480px;">' +
    '<div role="dialog" aria-modal="true" tabindex="-1" class="link-dialog-container" style="position: relative;">' +
    '<div class="wrapper" style="margin:25px">' + 
    '<div class="insertLink-form">' +
    '<div class="tox-form__groupX" style="margin-bottom:4px; box-sizing:border-box" aria-disabled="false">' +
    '<label class="tox-label" for="form-field_url">URL</label>' +
    '<div class="tox-form__controls-h-stack">' +
    '<div class="tox-control-wrap" aria-disabled="false">' +
    '<input type="url" aria-errormessage="aria-invalid_526777492591703822075552" role="combobox" aria-autocomplete="list" aria-haspopup="true" tabindex="-1" data-alloy-tabstop="true" class="tox-textfield" aria-expanded="false" id="form-field_url">' +
    '<div class="tox-control-wrap__status-icon-wrap">' +
    '<div title="invalid" aria-live="polite" id="aria-invalid_526777492591703822075552" class="tox-icon tox-control-wrap__status-icon-invalid">' +
    '<svg width="24" height="24"><path d="M19.8 18.3c.2.5.3.9 0 1.2-.1.3-.5.5-1 .5H5.2c-.5 0-.9-.2-1-.5-.3-.3-.2-.7 0-1.2L11 4.7l.5-.5.5-.2c.2 0 .3 0 .5.2.2 0 .3.3.5.5l6.8 13.6zM12 18c.3 0 .5-.1.7-.3.2-.2.3-.4.3-.7a1 1 0 00-.3-.7 1 1 0 00-.7-.3 1 1 0 00-.7.3 1 1 0 00-.3.7c0 .3.1.5.3.7.2.2.4.3.7.3zm.7-3l.3-4a1 1 0 00-.3-.7 1 1 0 00-.7-.3 1 1 0 00-.7.3 1 1 0 00-.3.7l.3 4h1.4z" fill-rule="evenodd"></path></svg></div></div></div>' +
    '<button title="URL" type="button" data-alloy-tabstop="true" tabindex="-1" id="optionButton" class="tox-button tox-button--icon tox-button--naked tox-browse-url btn-default yui-button" style="box-shadow: none;">' +
    '<span class="tox-icon tox-tbtn__icon-wrap"><svg width="24" height="24"><path d="M19 4a2 2 0 012 2v12a2 2 0 01-2 2h-4v-2h4V8H5v10h4v2H5a2 2 0 01-2-2V6c0-1.1.9-2 2-2h14zm-8 9.4l-2.3 2.3a1 1 0 11-1.4-1.4l4-4a1 1 0 011.4 0l4 4a1 1 0 01-1.4 1.4L13 13.4V20a1 1 0 01-2 0v-6.6z" fill-rule="nonzero"></path></svg></span>' +
    '</button>' +
    '</div></div>' +
    '<div class="tox-form__group" aria-disabled="false"><label class="tox-label" for="form-field_linkText">Text to display</label><input type="text" tabindex="-1" data-alloy-tabstop="true" class="tox-textfield" id="form-field_linkText"></div>' +
    '<div class="tox-form__group" aria-disabled="false"><label class="tox-label" for="form-field_linkTitle">Title</label><input type="text" tabindex="-1" data-alloy-tabstop="true" class="tox-textfield" id="form-field_linkTitle"></div>' +
    '<div class="tox-form__group" aria-disabled="false"><label class="tox-label" for="form-field_1211068102191703822078254">Open link in...</label><div class="tox-listboxfield"><div class="cstudio-form-control-dropdown-container"><select id="form-field_linkTarget" class="datum cstudio-form-control-dropdown" style="border-radius:3px;border-width:1px;width:100%;line-height:24px;font-size:16px;border-color:#ccc;border-style:solid;box-sizing:border-box;min-height:34px;padding:5px 4.75px"><option class="hide" disabled=""></option><option value="Self">Current window</option><option value="New">New window</option></select></div></div></div></div></div><div class="tox-dialog__footer"><div role="presentation" class="tox-dialog__footer-start"></div><div role="presentation" class="tox-dialog__footer-end">' +
    '<button id="dndCancelButton" title="Cancel" type="button" data-alloy-tabstop="true" tabindex="-1" class="cstudio-xform-button btn btn-default">Cancel</button><button id="dndInsertButton" title="Insert" type="button" data-alloy-tabstop="true" tabindex="-1" class="cstudio-xform-button btn btn-primary">Insert</button></div></div></div></div>'; 
    */

    // Instantiate the Dialog
    insertLink_dialog = new YAHOO.widget.Dialog('insertLink-dialog', {
      fixedcenter: true,
      visible: false,
      modal: true,
      close: true,
      constraintoviewport: true,
      underlay: 'none',
      title: 'xxx'
    });

    // Render the Dialog
    insertLink_dialog.render();
    YAHOO.util.Event.addListener(
      'optionButton',
      'click', 
      this.createControl, this, true);

    YAHOO.util.Event.addListener(
      'form-field_labelFromTax',
      'change',
      function () {
        var taxKey = document.getElementById('form-field_labelFromTax').value;
        var taxSelectEl = document.getElementById('form-field_labelFromTax');
        var taxValue = (taxSelectEl.selectedIndex != -1) ? taxSelectEl.options[taxSelectEl.selectedIndex].text : "";
        if (taxKey != "") {
          var displayTxt = document.getElementById('form-field_linkText');
          displayTxt.value = taxValue;
        }
      },
      this,
      true
    );

    YAHOO.util.Event.addListener('dndCancelButton', 'click', this.uploadPopupCancel, this, true);
    YAHOO.util.Event.addListener(
      'dndInsertButton',
      'click',
      function () {
        var url = document.getElementById('form-field_url');
        this.inputEl.value = url.value;

        var displayTxt = document.getElementById('form-field_linkText');

        this.displayTxtEl.innerHTML = (displayTxt.value === "") ? "&nbsp;" : displayTxt.value;

        if (this.inputEl.value == "") {
          this.displayTxtEl.innerHTML = "&nbsp;";
          this.taxKey = "";
          this.taxValue = "";
        } else {
          this.taxKey = document.getElementById('form-field_labelFromTax').value;
          var taxSelectEl = document.getElementById('form-field_labelFromTax');
          this.taxValue = (taxSelectEl.selectedIndex != -1) ? taxSelectEl.options[taxSelectEl.selectedIndex].text : "";  
        }

        this.linkTitle = document.getElementById('form-field_linkTitle').value;

        var state = document.getElementById('form-field_linkTarget').value;
        this.linkTarget = (state == "New") ? "_blank" : "";

        if (this.taxKey != "")
          this.displayTxtEl.innerHTML = this.taxValue;

        this.insertLink_dialog.destroy();
        this._onChangeVal(null, this);
      },
      this,
      true
    );
    this.insertLink_dialog = insertLink_dialog;
    var titleEl = document.getElementById('insertLink-dialog_h');
    var txt = document.createTextNode('Insert/Edit Link');
    titleEl.style = "padding-left:25px";
    titleEl.removeChild(titleEl.firstChild);
    titleEl.appendChild(txt);

    var urlEl = document.getElementById('form-field_url');
    urlEl.value = this.inputEl.value;

    if (this.value.length > 0) {
      var textEl = document.getElementById('form-field_linkText');
      textEl.value = (this.value[0].linkText === "&nbsp;") ? "" : this.value[0].linkText;

      var titleEl = document.getElementById('form-field_linkTitle');
      titleEl.value = this.value[0].linkTitle;

      var taxEl = document.getElementById('form-field_labelFromTax');
      taxEl.value = this.value[0].taxKey;

      if (taxEl.value != "") 
       textEl.value = this.value[0].taxValue;

      var targetEl = document.getElementById('form-field_linkTarget');
      targetEl.value = (this.value[0].linkTarget == "_blank") ? "New" : "Self";
    }

    insertLink_dialog.show();

    insertLink_dialog.element.style.setProperty('z-index', '1040', 'important');
    insertLink_dialog.mask.style.zIndex = '1030';
  },

  createControl: function (cb, meta) {
    var datasourcesNames = '';
    var fileManagerNames = this.datasourceName;

    var type = 'item';
    var addContainerEl;
    var linkInputContainer = $('.link-dialog-container')

    if (fileManagerNames !== '') {
      if (datasourcesNames !== '') {
        datasourcesNames += ',';
      }
      datasourcesNames += fileManagerNames;
    }

    if (this.addContainerEl) {
      addContainerEl = this.addContainerEl;
      this.addContainerEl = null;
      $('.cstudio-form-control-image-picker-add-container').remove();
    } else {
      addContainerEl = document.createElement('div');
      linkInputContainer.append(addContainerEl);
      YAHOO.util.Dom.addClass(addContainerEl, 'cstudio-form-control-image-picker-add-container');
      YAHOO.util.Dom.addClass(addContainerEl, 'cstudio-tinymce');
      this.addContainerEl = addContainerEl;

      addContainerEl.style.position = 'absolute';
      addContainerEl.style.right = '25px';
      addContainerEl.style.top = '39px';

      var datasourceMap = this.form.datasourceMap;
      var datasourceDef = this.form.definition.datasources;
      var addFunction = this.addManagedFile;
  
      var addMenuOption = function (el) {
        // We want to avoid possible substring conflicts by using a reg exp (a simple indexOf
        // would fail if a datasource id string is a substring of another datasource id)
        var regexpr = new RegExp('(' + el.id + ')[\\s,]|(' + el.id + ')$'),
          mapDatasource;

        if (datasourcesNames.indexOf(el.id) != -1 && el.interface === type && el.type != 'simpleTaxonomy') {
          mapDatasource = datasourceMap[el.id];

          var itemEl = document.createElement('div');
          YAHOO.util.Dom.addClass(itemEl, 'cstudio-form-control-image-picker-add-container-item');
          itemEl.textContent = el.title;
          addContainerEl.appendChild(itemEl);

          YAHOO.util.Event.on(
            itemEl,
            'click',
            function () {
              this.addContainerEl = null;
              $('.cstudio-form-control-image-picker-add-container').remove();

              addFunction(mapDatasource, cb);
            },
            itemEl
          );
        }
      };
      datasourceDef.forEach(addMenuOption);

      // If no datasources for type
      if ($(addContainerEl).children().length === 0) {
        var itemEl = document.createElement('div');
        YAHOO.util.Dom.addClass(itemEl, 'cstudio-form-control-image-picker-add-container-item');
        itemEl.innerHTML = 'No datasources available';
        addContainerEl.appendChild(itemEl);
      }
    }
  },

  uploadPopupCancel: function (event) {
    this.insertLink_dialog.destroy();
  },

  showEditLinkDialog: function () {
    var CMgs = CStudioAuthoring.Messages;
    var langBundle = CMgs.getBundle('forms', CStudioAuthoringContext.lang);
    // Disable Edit button to not allow double clicks
    this.editEl.disabled = true;

    var query = location.search.substring(1);
    var thisPage = CStudioAuthoring.Utils.getQueryVariable(query, 'path');
    var order = 'default';

    var callback = {
      success: function (contentTypes) {
        var query = location.search.substring(1);
        var currentPath = CStudioAuthoring.Utils.getQueryVariable(query, 'path');
        var contentTypeSize = contentTypes.order.length;

        var pageFound = 'false';
        for (var i = 0; i < contentTypeSize; i++) {
          var orderId = contentTypes.order[i].id;

          if (orderId == currentPath) {
            contentTypes.order[i].internalName = CMgs.format(langBundle, 'currentPage');
            contentTypes.order[i].order = this.parentControl.orderValue;
            pageFound = 'true';
            break;
          }
        }

        if (pageFound == 'false') {
          contentTypes.order.push({
            id: currentPath,
            order: this.parentControl.orderValue,
            internalName: CMgs.format(langBundle, 'currentPage'),
            name: CMgs.format(langBundle, 'currentPage')
          });
        }

        panelId = 'panel1';
        CStudioAuthoring.Service.reorderServiceCreatePanel(
          panelId,
          contentTypes,
          CStudioAuthoringContext.site,
          this.parentControl
        );
        // Enable Edit button
        this.parentControl.editEl.disabled = false;
      },

      failure: function () {
        // Enable Edit button
        this.parentControl.editEl.disabled = false;
      }
    };
    callback.parentControl = this;

    CStudioAuthoring.Service.getOrderServiceRequest(CStudioAuthoringContext.site, thisPage, order, callback);
    this.editEl.disabled = false;
  }
});

CStudioAuthoring.Module.moduleLoaded('link', CStudioForms.Controls.Link);
