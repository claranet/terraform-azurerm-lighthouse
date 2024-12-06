## 8.0.0 (2024-12-06)

### ⚠ BREAKING CHANGES

* **AZ-1088:** AzureRM Provider v4+ and OpenTofu 1.8+

### Features

* **AZ-1088:** module v8 structure and updates 7d32a3e

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.8.3 3ff0ecd
* **deps:** update dependency opentofu to v1.8.4 f4ac198
* **deps:** update dependency opentofu to v1.8.6 f1d98f4
* **deps:** update dependency pre-commit to v4 cf96f93
* **deps:** update dependency pre-commit to v4.0.1 c219327
* **deps:** update dependency tflint to v0.54.0 e9e52b6
* **deps:** update dependency trivy to v0.56.1 1a2aa8f
* **deps:** update dependency trivy to v0.56.2 19ce4b1
* **deps:** update dependency trivy to v0.57.1 35bc350
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.19.0 1b7985d
* **deps:** update pre-commit hook pre-commit/pre-commit-hooks to v5 aaa7b10
* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.1.0 e9dd26e
* **deps:** update tools bc607eb
* **deps:** update tools f135922
* prepare for new examples structure 32973ab
* update examples structure 00bd457

## 7.0.1 (2024-10-03)

### Documentation

* update README badge to use OpenTofu registry ac68f38
* update README with `terraform-docs` v0.19.0 a08f37d

### Continuous Integration

* **AZ-1391:** enable semantic-release [skip ci] f1b8361
* **AZ-1391:** update semantic-release config [skip ci] 44f4ed9

### Miscellaneous Chores

* **deps:** add renovate.json 3549744
* **deps:** enable automerge on renovate 0363e11
* **deps:** update dependency opentofu to v1.7.0 5ca2ee5
* **deps:** update dependency opentofu to v1.7.1 78e7700
* **deps:** update dependency opentofu to v1.7.2 606af2c
* **deps:** update dependency opentofu to v1.7.3 71edff9
* **deps:** update dependency opentofu to v1.8.0 aee4ce9
* **deps:** update dependency opentofu to v1.8.1 2b307be
* **deps:** update dependency opentofu to v1.8.2 d2eb543
* **deps:** update dependency pre-commit to v3.7.1 7a6d584
* **deps:** update dependency pre-commit to v3.8.0 d2df0e3
* **deps:** update dependency terraform-docs to v0.18.0 b38e833
* **deps:** update dependency terraform-docs to v0.19.0 e6e085a
* **deps:** update dependency tflint to v0.51.0 58f003a
* **deps:** update dependency tflint to v0.51.1 6b6771a
* **deps:** update dependency tflint to v0.51.2 fb787a8
* **deps:** update dependency tflint to v0.52.0 a4198a9
* **deps:** update dependency tflint to v0.53.0 893cf48
* **deps:** update dependency trivy to v0.50.2 923b1b9
* **deps:** update dependency trivy to v0.50.4 a05d0f4
* **deps:** update dependency trivy to v0.51.0 0ad09ad
* **deps:** update dependency trivy to v0.51.1 7bb33ca
* **deps:** update dependency trivy to v0.51.2 eaff95b
* **deps:** update dependency trivy to v0.51.4 0401c2a
* **deps:** update dependency trivy to v0.52.0 a2c20b6
* **deps:** update dependency trivy to v0.52.1 91fba4c
* **deps:** update dependency trivy to v0.52.2 9e156de
* **deps:** update dependency trivy to v0.53.0 bc8c7a5
* **deps:** update dependency trivy to v0.54.1 16af9b7
* **deps:** update dependency trivy to v0.55.0 9115c57
* **deps:** update dependency trivy to v0.55.1 20d698f
* **deps:** update dependency trivy to v0.55.2 bc01382
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.17.0 d903376
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.18.0 02fef88
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.0 9336a89
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.1 74b3af2
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.2 6ea2d7e
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.3 7f0a81b
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.93.0 9d3c502
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.0 d3021b9
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.1 01b7b89
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.2 101cb89
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.3 a44d8af
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.95.0 658dd65
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.0 a2f0b38
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.1 af0ed4c
* **deps:** update renovate.json 182c13a
* **pre-commit:** update commitlint hook c0c646a
* **release:** remove legacy `VERSION` file 754a16c

# v7.0.0 - 2023-03-24

Breaking
  * AZ-1016: Minimum Terraform version required `v1.3`

Added
  * AZ-1016: Support `delegated_role_names` attribute in authorizations for `User Access Administrator` role

# v6.0.0 - 2022-06-03

Breaking
  * AZ-717: Minimum Terraform version required `v1.1`
  * AZ-717: Upgrade module to AzureRM provider `v3.0+`

Changed
  * AZ-572: Revamp examples and improve CI

# v4.0.1 - 2021-08-27

Updated
  * AZ-532: Revamp README with latest `terraform-docs` tool

# v4.0.0 - 2021-03-31

Added
  * AZ-360: Azure LightHouse module, first Release
