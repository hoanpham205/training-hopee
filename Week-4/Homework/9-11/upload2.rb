require "googleauth"

credentials = Google::Auth::UserRefreshCredentials.new(
 client_id: "92307737436-c99amf6ku014fdfqtkic3aro7p6p2pgu.apps.googleusercontent.com
 ",
 client_secret: "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",
 scope: [
   "https://www.googleapis.com/auth/drive",
   "https://spreadsheets.google.com/feeds/",
 ],
 redirect_uri: "http://example.com/redirect")
auth_url = credentials.authorization_uri
credentials.code = authorization_code
credentials.fetch_access_token!
session = GoogleDrive::Session.from_credentials(credentials)

