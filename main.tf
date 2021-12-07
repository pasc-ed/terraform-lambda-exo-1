# GENERATE A ZIP FILE FOR OUR PYTHON CODE SCRIPT
data "archive_file" "pet_script" {
  type        = "zip"
  source_file = "${path.module}/files/${var.pet_script_filename}.py"  # SOURCE OF THE FILE
  output_path = "${path.module}/files/${var.pet_script_filename}.zip" # DESTINATION OF THE GENERATED FILE (.zip)
}
