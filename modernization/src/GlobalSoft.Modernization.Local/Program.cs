using GlobalSoft.Modernization.Local;

var databasePath = args.Length > 0
    ? args[0]
    : Path.Combine(
        Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),
        "GlobalSoft",
        "data",
        "globalsoft-local.db");

var store = new LocalStore(databasePath);
await store.InitializeAsync();
Console.WriteLine($"GlobalSoft local store ready: {databasePath}");
