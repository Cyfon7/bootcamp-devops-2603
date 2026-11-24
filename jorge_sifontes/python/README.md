# Setup Python's virtual environment

# In some cases it might be required to install the right environment
apt install python3.12-venv

# Create & activate environment
python3 -m venv .venv
source .venv/bin/activate

# Update and verify environment is working
python -m pip install --upgrade pip
python -c "import sys; print(sys.executable)"

# Ensure virtual environment to be ignored by git
echo ".venv/" >> .gitignore

