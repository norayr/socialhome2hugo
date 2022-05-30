MODULE s2h;
IMPORT Out, Args, Strings := oocStrings, StringList, Files, oocIntStr,
       socialhomedb;

CONST
  title = "…";
  author = "նորայր_չիլինգարեան";
  defcat = "սփիւռք_գրառումներ";
  purl = "https://spyurk.am/posts/";

PROCEDURE help;
BEGIN
  Out.String("usage:"); Out.Ln;
  Out.String("./s2h username [postid]"); Out.Ln;
  Out.Ln;
  Out.String("if optional postid argument given, then hugo files will be generated starting from that post."); Out.Ln;
  Out.Ln;
END help;

PROCEDURE parseArgs(VAR u, sposid: ARRAY OF CHAR);
BEGIN
 IF Args.argc > 1 THEN
   Args.Get(1, u);
   IF Args.argc > 2 THEN
   Args.Get(2, sposid)
   END
 ELSE
   help;
   HALT(1)
 END
END parseArgs;

PROCEDURE main;
VAR
  authorID, postID: ARRAY 8 OF CHAR;
  username, sposid: ARRAY 16 OF CHAR;
  postIDs, text, tags: StringList.TStringList;
  process: BOOLEAN;
BEGIN
  process := TRUE;
  Strings.Assign("", sposid);
  parseArgs(username, sposid);
  Out.String("starting post id "); Out.String(sposid); Out.Ln;
  IF sposid # "" THEN process := FALSE END;
  Out.String("process is ");
  IF process THEN Out.String("true") ELSE Out.String("else"); Out.Ln END;
  socialhomedb.getAuthorId(username, authorID);
  Out.String("got author id: "); Out.String(authorID); Out.Ln;
  postIDs := socialhomedb.getListOfPosts(authorID, TRUE);  
END main;


END s2h.
