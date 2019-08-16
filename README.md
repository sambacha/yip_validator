# SIP validator

## Validation rules

### Mandatory fields

- sip or sccp
- title
- author
- status
- created

### Optional fields

- discussions-to
- layer
- replaces
- requires
- resolution
- review-period-end
- superseded-by
- updated

### Mandatory values

- `status` must be 'WIP', 'Proposed', 'Approved', or 'Implemented'
## Prerequisite

- ruby

## Setup

```
gem install sip_validator
```

## Usage (command line)

```ruby
sip_validator INPUT_FILES
```

## Usage (as a lib)

```ruby
require 'sip_validator

SipValidator::Runner.run 
```

### Example

```
$sip_validator  ~/src/SIPs/SIPS/*[0-9].md

total:1, valid:1, invalid:0, errors:0
	statuses: [["Implemented", 1]]

```

## Running tests

```
bundle exec rspec
```

## Releasing new gem

```
gem bump --version patch|minor|major
bundle exec rake release
```