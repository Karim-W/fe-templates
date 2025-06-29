#!/bin/sh

echo "Please Selec the template you want to use:"
echo "1. React SSR (Remix)"
echo "2. React SPA (Vite)"

read -p "Enter your choice: " choice

if [ "$choice" = "1" ]; then
  template="remix"
elif [ "$choice" = "2" ]; then
  template="vite"
else
  echo "Invalid choice. Exiting."
  exit 1
fi

read -p "Enter the name of your project: " project_name

if [ -z "$project_name" ]; then
  echo "Project name cannot be empty."
  exit 1
fi

## Clone the temlate repository
git clone github.com/karim-w/fe-templates .ft || { echo "Failed to clone template repository."; exit 1; }

echo "Creating project '$project_name' with template '$template'..."

if [ "$template" = "remix" ]; then
  mv .ft/react-server-side ./"$project_name"
elif [ "$template" = "vite" ]; then
  mv .ft/react-client-side ./"$project_name"
fi

rm -rf .ft

cd "$project_name" || { echo "Failed to change directory to '$project_name'."; exit 1; }

find ./ -type f -name "*" -exec sed -i "s/{{}.APP_NAME}/$project_name/g" {} \;

echo "Project '$project_name' created successfully with template '$template'."

echo "Installing dependencies..."

echo "Please choose the package manager you want to use:"
echo "1. npm"
echo "2. yarn"
echo "3. pnpm"
echo "4. bun"
echo ""

read -p "Enter your choice: " pm_choice

if [ "$pm_choice" = "1" ]; then
  npm install
elif [ "$pm_choice" = "2" ]; then
  yarn install
elif [ "$pm_choice" = "3" ]; then
  pnpm install
elif [ "$pm_choice" = "4" ]; then
  bun install
else
  echo "Invalid choice. Exiting."
  exit 1
fi


echo "Dependencies installed successfully."

echo "You can now start your project by running the following command:"
if [ "$template" = "remix" ]; then
  echo "npm run dev"
else
  echo "npm run dev"
fi



