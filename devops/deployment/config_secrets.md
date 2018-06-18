# Managing Secrets (e.g. passwords)

Repeat after me: Never ever commit passwords, secret API keys and any other kind of secret variables into your git repo! Bad things will happen

Secrets should be replaced with environment variables. For example: 

```javascript
// bad!!!
const db_password = 'sup3r_secr3t'

// good
const db_password = process.env.DB_PASSWORD
// in local env, define DB_PASSWORD='sup3r_secr3t' and load your environment variables (e.g. using foreman)
// in staging/production env, define DB_PASSWORD='sup3r_secr3t' as a environment variable
```
