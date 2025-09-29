library(blastula)
library(keyring)

create_smtp_creds_key(
  id = "gmail",
  user = "jules.walzergoldfeld@posit.co",
  provider = "gmail",
  overwrite = TRUE
)

create_smtp_creds_key(
  id = "personal_gmail",
  user = "jules.walzergoldfeld@gmail.com",
  provider = "gmail",
  overwrite = TRUE
)

view_credential_keys()

test_message <- prepare_test_message()

img_file_path <-
  system.file(
    "img",
    "sunset.jpeg",
    package = "blastula"
  )

img_html <- add_image(file = img_file_path)

email <-
  md(
      c(
        "Hello,

Here is an image:\n",
        img_html
      )
  )

email %>%
  smtp_send(
    from = "Jules",
    to = "jules.walzergoldfeld@gmail.com",
    subject = "Testing the `smtp_send()` function in blastula",
    credentials = creds_key(id = "personal_gmail")
  )




