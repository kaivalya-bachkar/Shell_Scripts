#keypair
resource "aws_key_pair" "TF_key_pair" {
  key_name   = "MyTfkey"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKVlOOeMc+qDhYx8ZWI9/mK/B0HC0AEvMSuvXWCztRO4 root@Angrybird"
}