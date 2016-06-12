for package in 118 25 141 2 4 152
do
  # Auto accept license
  echo "Installing $package"
  echo "y" | android update sdk  --no-ui --all --filter $package
  echo
  echo
done
