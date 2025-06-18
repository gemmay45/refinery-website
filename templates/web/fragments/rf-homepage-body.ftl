<#import "/templates/system/common/crafter.ftl" as crafter />
<#import "/templates/web/fragments/macro.ftl" as macro />

<@macro.renderHeaderItems contentModel />
<div id="content">
<@macro.renderHomepageSectionItems contentModel />
        
<div id="content-area-2">
          </div>
        <script>
          // JavaScript code to make AJAX call
            fetch('/studio/api/2/users/gemma', {
              method: 'GET',
                headers: {
                'Authorization': 'Bearer eyJhbGciOiJQQkVTMi1IUzUxMitBMjU2S1ciLCJlbmMiOiJBMjU2Q0JDLUhTNTEyIiwiY3R5IjoiSldUIiwicDJjIjo2NTUzNiwicDJzIjoiNXY4Qmo1NTFSbFFjSE1OdiJ9.Q05hJYGkHUwcjnqdKfLoVx-tmlWbw6ij6mNUHTQQyv2VKiRd9bDJTSS3ALi92jI9lPsbS_eW2ueNqDq91Ev1AWYkblR8GE2T.Zkpf8kpnsdQGTgGLGyOmnQ.I7xvNibFPWcI4kuYHIxzCiEqrnixiUTP0kMfJzDF5pkgIL3Q3aXahr2n2DTRYmuXOX2K5eBIF7lSMisWNwP2FCLJb_sJRjMV5Od5fphSlYYLacCfopG3XL7xcjna72jRnX05vgn7GsgrxP0QwcrE6ImesB_x9BNd7EjIP5N48XUqELBMN3T9mPk2ks9jOSmcDCSpmObOY3mKa8PiSeoJPAOy9yZAfftG7fwDGijPrhW2Y0Gq2pAxwAYoCbPwjalKSz7Mbq29ub__RDF5I6q9vVB8vL0UeSOJZnjoTU_6Q-gsjVgJ1Gyy3w1HxA9FbYm2BjIlyp5M_wFBU-xnUQFRrQ.BpY72Etvksb9sX1ucSJjXd6GSUdiEya9YYdC-2ui25g'
                }
            })
            .then(response => response.json())
            .then(data => {
            console.log(data);
              // Update the page with the data
              document.getElementById('content-area-2').innerHTML = data;
            });
        </script>

<div id="content-area">
          </div>
        <script>
          // JavaScript code to make AJAX call
            fetch('/studio/api/2/users/gemma/sites/refinery-website-2/roles', {
              method: 'GET',
                headers: {
                'Authorization': 'Bearer eyJhbGciOiJQQkVTMi1IUzUxMitBMjU2S1ciLCJlbmMiOiJBMjU2Q0JDLUhTNTEyIiwiY3R5IjoiSldUIiwicDJjIjo2NTUzNiwicDJzIjoiNXY4Qmo1NTFSbFFjSE1OdiJ9.Q05hJYGkHUwcjnqdKfLoVx-tmlWbw6ij6mNUHTQQyv2VKiRd9bDJTSS3ALi92jI9lPsbS_eW2ueNqDq91Ev1AWYkblR8GE2T.Zkpf8kpnsdQGTgGLGyOmnQ.I7xvNibFPWcI4kuYHIxzCiEqrnixiUTP0kMfJzDF5pkgIL3Q3aXahr2n2DTRYmuXOX2K5eBIF7lSMisWNwP2FCLJb_sJRjMV5Od5fphSlYYLacCfopG3XL7xcjna72jRnX05vgn7GsgrxP0QwcrE6ImesB_x9BNd7EjIP5N48XUqELBMN3T9mPk2ks9jOSmcDCSpmObOY3mKa8PiSeoJPAOy9yZAfftG7fwDGijPrhW2Y0Gq2pAxwAYoCbPwjalKSz7Mbq29ub__RDF5I6q9vVB8vL0UeSOJZnjoTU_6Q-gsjVgJ1Gyy3w1HxA9FbYm2BjIlyp5M_wFBU-xnUQFRrQ.BpY72Etvksb9sX1ucSJjXd6GSUdiEya9YYdC-2ui25g'
                }
            })
            .then(response => response.json())
            .then(data => {
            console.log(data);
              // Update the page with the data
              document.getElementById('content-area').innerHTML = data;
            });
        </script>        
</div>
<@macro.renderFooterItems contentModel />
