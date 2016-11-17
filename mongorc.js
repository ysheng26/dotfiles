
// Prompt format:
//
// db @ host [Master | Slave] [TIME]
// > COMMAND
//
// (nodb)
// > COMMAND
//
// For example:
//
// % playground @ Thinkpad [Master] [Thu Nov 17 11:26:14 2016]
// >
prompt = function() {
  var strSymbol = '\n> ';

  if (typeof db == 'undefined') {
    return 'mongodb (nodb)' + strSymbol;
  }

  // Check the last db operation
  try {
    db.runCommand({getLastError:1});
  }
  catch (e) {
    print(e);
  }

  // db is defined by mongo
  // Master | Secondary
  var strMasterSlave = '[Master]';
  if (!db.isMaster().ismaster) {
    strMasterSlave = '[Slave]';
  }

  // host
  var strHost= db.serverStatus().host;

  // Date and time
  var strDateAndTime = '[' + ISODate().toLocaleTimeString() + ']';

  var arrPrompt = [
    db,
    '@',
    strHost,
    strMasterSlave,
    strDateAndTime,
    strSymbol
  ];

  var strPrompt = arrPrompt.join(' ');

  return strPrompt;
}

