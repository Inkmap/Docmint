
{if isset($response)}
      <!-- $response from CURL
      ================================================== -->
      <div class="bs-docs-section">
        <div class="row">
          <div class="col-lg-12">
            <div class="page-header">
              <h4>$response</h4>
            </div>
            <div class="bs-component">
                <pre>{$response|print_r}</pre>
            </div><!-- /example -->
          </div>
        </div>
      </div>
{/if}     
      <!-- Info table
      ================================================== -->
      <div class="bs-docs-section">

        <div class="row">
          <div class="col-lg-12">
            <div class="page-header">
              <h4>Info</h4>
            </div>

            <div class="bs-component">
              <table class="table table-striped table-hover ">
                <thead>
                  <tr>
                    <th>Org</th>
                    <th>Dept</th>
                    <th>Team</th>
                    <th>User</th>
                    <th>Project</th>
                    <th>REST</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>{$ses.org}</td>
                    <td>{$ses.dpt}</td>
                    <td>{$ses.team}</td>
                    <td>{$ses.user}</td>
                    <td>{$ses.project}</td>
                    <td>{$ses.rest}</td>
                  </tr>
                </tbody>
              </table> 
            </div><!-- /example -->
          </div>
        </div>
      </div>