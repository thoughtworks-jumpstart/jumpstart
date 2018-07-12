# Installing MongoDB

## Installing MongoDB

Install MongoDB for your operating system.

### macOS with Homebrew

```text
brew install mongodb
```

### Windows

Download the **Community Server** from [https://www.mongodb.com/download-center\#community](https://www.mongodb.com/download-center#community) for your specific OS version.

If you're running Windows, please add the MongoDB `bin` folder to your System PATH \(e.g. `C:\Program Files\MongoDB\Server\4.0\bin`\).

### Linux \(Ubuntu\)

Find the instructions for your specific OS and version for the **Community Server** from [https://www.mongodb.com/download-center\#community](https://www.mongodb.com/download-center#community).

If the installation step complains of an incompatible `libcurl`, check the section in the guide on how to update it.

### Verify the installation

Run the following command in a fresh terminal window to verify that Mongo has been installed successfully:

```bash
mongod --version
```

You should see the version information printed on your console.

## Install a Visual Studio Code extension for viewing data in MongoDB

1. Open the Extensions pane in Visual Studio Code
2. Search for the _Azure Cosmos DB_ extension by Microsoft
3. Install it and Reload vscode once the installation completes
4. Click the new Azure icon in the left sidebar
5. Create a new MongoDB connection by clicking the 'plug' icon and selecting 'MongoDB' from the dropdown
   * Make sure to start the server before connecting to it

## Start your MongoDB server

```bash
mongod --dbpath /data/mongodb
```

The `--dbpath` option specifies the location where MongoDB should store data. It can be any folder you create. `/data/mongodb` is just one example.

Note that the path to `mongod.exe` and the path to your data folder could be different on your system.

Depending on the security level of your system, Windows may pop up a Security Alert dialog box about blocking “some features” of C:\Program Files\MongoDB\Server\3.6\bin\mongod.exe from communicating on networks. All users should select Private Networks, such as my home or work network and click Allow access.

Once the MongoDB server is started, you should see the following line on your console:

```text
[initandlisten] waiting for connections on port 27017
```

