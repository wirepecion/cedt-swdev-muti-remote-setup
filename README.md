# cedt-swdev-muti-remote-setup

## **Overview**
This repository provides an **automated script** for setting up multiple Git remotes in a classroom and personal repository setup. It streamlines the process of cloning a **classroom repository**, configuring Git user details, and adding multiple remote repositories for seamless collaboration.

## **Features**
✅ Automatically clones the **classroom repository** into the correct directory  
✅ Extracts the correct repository name from the URL  
✅ Automatically **configures Git user details** (only asks once)  
✅ Adds both **classroom and personal repositories** as remotes  
✅ Ensures the correct remote branch is set  

## **Prerequisites**
- Git installed on your system (`git --version` to check)
- A **classroom repository** URL (e.g., `https://github.com/example-classroom/swdev-project.git`)
- A **personal repository** URL (e.g., `https://github.com/example-user/swdev-project.git`)

## **Installation & Usage**

### 1. Clone this repository:
```sh
git clone https://github.com/example-user/cedt-swdev-muti-remote-setup.git
cd cedt-swdev-muti-remote-setup
```

### 2. Make the script executable:
```sh
chmod +x git_remote_setup.sh
```

### 3. Run the script:
```sh
. git_remote_setup.sh
```

### 4. Follow the prompts:
- Enter the **classroom repository URL**.
- Enter the **personal repository URL**.
- If Git user details **aren’t set**, enter them **once** (they’ll be stored globally).

### 5. Verify remotes:
```sh
git remote -v
```

---

## **How It Works**
1. Extracts the **repo name** from the classroom repository URL.
2. Clones the **classroom repository** into a correctly named directory.
3. **Sets Git username and email** (only once, stored globally).
4. **Adds both repositories as remotes** (`all` remote for pushing to both).
5. **Sets the correct upstream branch**.
6. **Confirms setup success** with:
   ```sh
   git remote -v
   ```

---

## **Example Output**
```sh
Enter classroom repository URL: https://github.com/example-classroom/swdev-project.git
Enter personal repository URL: https://github.com/example-user/swdev-project.git
Using existing Git config: example-user <example@example.com>
Cloning into: swdev-project...
Cloning successful. Changing directory...
```

---

## **Troubleshooting**
- If the script doesn't persist `cd`, run:
  ```sh
  source ./git_remote_setup.sh
  ```
- To manually check your Git config:
  ```sh
  git config --global --list
  ```

## **License**
MIT License

## **Author**
[example-user](https://github.com/example-user)
