# Shoutr

A Twitter clone created by following along with [Thoughtbot's intermediate Rails 5 course](Following along with Thoughtbot's intermediate Ruby course https://thoughtbot.com/upcase/intermediate-ruby-on-rails-five).

## Motivation

I want to learn Rails in order to more quickly bring my own product ideas to life as well as to round out my web dev skills.

## Setup

### Image transformation

We are using `ActiveStorage` to handle files for us.
We do not want to display user files at full resolution, so we use mini magick (a gem) to help with resizing. This requires that [imagemagick](https://imagemagick.org/script/download.php) be installed on your machine.
