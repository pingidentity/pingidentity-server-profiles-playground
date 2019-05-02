# Ping Identity Server Profile Playground (pingone-cloud)

This server profile provides a simple PingDataSync example synchronizing users from a
Microsoft Azure AD Tenant to a Ping Identity PingOne Cloud Environment.

## PreRequisites
Before you run this sample, you will need to have services available in both:

  * Microsoft AzureAD
  * PingIdentity PingOne for Customers (click [here](https://developer.pingidentity.com/content/p14c/en/signup.html) for a free trial)

Once you get these services running, you need the following information for each
service to provide to the `configure` script.

  * Microsoft AzureAD
    * Microsft Azure TenantID
    * Microsft Azure Application Registration ClientID
    * Microsft Azure Application Registration ClientSecret
  * PingIdentity PingOne for Customers 
    * PingOne EnvironmentID
    * PingOne PopulationID
    * PingOne ClientID
    * PingOne ClientSecret

## Quickstart Steps
There are several scripts provided to easy demonstrate this sample

1. git clone the pingidentity-server-profiles-playground

   ```shell
   git clone https://github.com/pingidentity/pingidentity-server-profiles-playground
   ```

2. Go to the pingone-cloud directory.

   ```shell
   cd pingidentity-server-profiles-playground/pingone-cloud
   ```

3. Execute the `run` script.  If this the first time, you've run this script here, it will
   call the `configure` script and ask you for the several AzureAD and PingOne vabiables
   used to connect to the two services.

   It will startup the services in Swarm defined in the 
   `docker-compose.yaml` file.  And the `run` command won't finish
   until the DataSync container is in a healthy state.

   Note: This may take up to a couple of minutes for the service to come
   up into a healthy state. 

   ```shell
   ./run
   ```

4. Now run the `resync` command which will sync all
   users from your AzureAD tenant to the PingOne environment/population.

   Note: This will sync only certain attributes for all users in your 
   AzureAD source.  See the example DataSync dsconfig commands in the
   server-profile to see how you can add additional attributes and
   filter only specific users to sync.

   ```shell
   ./resync
   ```

5. Finally, to stop and clenaup the swarm service, simply run the `stop` command.

   ```shell
   ./stop
   ```
