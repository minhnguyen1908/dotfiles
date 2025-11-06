# === My WebSocket Playground ===

# --- 1. Define Your Constants ---

let server_url = "ws://192.168.1.174:80/i-trade/G2WsSocketEpt"
let login_id = "afe06"
let login_pass = "1234"

print $"Logging in to ($server_url) as ($login_id)..."

# --- 2. Login and Get Session Key ---

# Build the login payload
let login_payload = {
    COMMAND: "LOGIN_REQUEST",
    LOGIN_ID: $login_id,
    PASSWORD: $login_pass,
    CHANNEL: "WU",
    LANG: "EN"
}

# Send the request and parse the response
let login_response = (
    $login_payload
    | to json
    | websocat $server_url
    | lines
    | from jsonl
)

# --- 3. Get Your Keys from the Login ---
# We need to guess the field names from the server's reply.
# I'll guess 'SESSION_KEY' and 'ACCOUNT_ID' based on your new JSON.
#
# !! You will need to change these 'get' commands
# to match the *real* JSON response you get from the server !!
#
let session_key = ($login_response | get SESSION_KEY)
let account_id = "011C000020"

# Check if login worked
if $session_key == null {
    print "Login failed! Did not get a SESSION_KEY."
    print $login_response
    return
}

print $"Logged in! Got session key: ($session_key)"


# --- 4. Send Account List Request (Your New JSON) ---

print "Sending account list request..."

# Build the second payload using our saved variables!
let account_list_payload = {
    COMMAND: "ACCESSIBLE_ACCOUNT_LIST_QUERY_REQUEST",
    LOGIN_ID: $login_id,
    USER_ID: $login_id,
    ACCOUNT_ID: $account_id, # <-- Using the key from step 3
    SESSION_KEY: $session_key, # <-- Using the key from step 3
    REQ_ID: "accessible account list request 1",
    CHANNEL: "WU",
    LANG: "EN"
}

# Send the request and save the final, static JSON
let $final_data = (
    $account_list_payload
    | to json
    | websocat $server_url
    | lines
    | from jsonl
)

# --- 5. Play With Your Static JSON ---
print "--- Got final response! ---"

# This is the "static" data you can play with
$final_data
