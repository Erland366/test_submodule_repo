Write-Host "Creating Conda environment 'unsloth_env'..."

conda create --prefix  --name unsloth_env python=3.1 -y

if ($LASTEXITCODE -ne 0) {
    Write-Error "Error creating Conda environment."
    exit 1
}

Write-Host "Run Conda init (if not yet performed)"
conda init

Write-Host "Activating Conda environment 'unsloth_env'..."
conda activate unsloth_env

if ($LASTEXITCODE -ne 0) {
    Write-Error "Error activating Conda environment."
    exit 1
}

# Write-Host "Installing Pytorch via pip..."
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124

if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to install Pytorch."
    exit 1
}

Write-Host "Installing required packages via pip..."
pip install --no-deps trl peft accelerate bitsandbytes

if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to install required packages."
    exit 1
}

Write-Host "Installing xformers..."
pip3 install -U xformers --index-url https://download.pytorch.org/whl/cu124

if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to install xformers."
    exit 1
}

Write-Host "Installing Unsloth from Git repository..."
pip install --upgrade --no-cache-dir git+https://github.com/unslothai/unsloth.git

if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to install Unsloth."
    exit 1
}

Write-Host "Installing Unsloth-zoo"
pip install unsloth-zoo

if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to install Unsloth-zoo."
    exit 1
}

Write-Host "Downloading Triton wheel file..."
$tritonWheelUrl = "https://github.com/woct0rdho/triton-windows/releases/download/v3.1.0-windows.post5/triton-3.1.0-cp311-cp311-win_amd64.whl"
$tritonWheelPath = "$env:TEMP\triton-3.1.0-cp311-cp311-win_amd64.whl" # Save to a temporary directory
Invoke-WebRequest -Uri $tritonWheelUrl -OutFile $tritonWheelPath

Write-Host "Installing Triton from wheel file..."
pip install $tritonWheelPath

if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to install Triton."
    exit 1
}

Write-Host "Installation completed successfully!"
Write-Host "You can activate the environment with: conda activate unsloth_env"