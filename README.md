# VM for Ethereum smart contract development
on the basis of Ubuntu 20.04. with pre-installed software e.g. Truffle + Hardhat to get started straight away.

See [bootstrap.sh](bootstrap.sh) for software versions.

## Get started
### Download Vagrant for your system
:arrow_right: https://www.vagrantup.com/downloads

### Prepare development environment

1. Clone this repo
    ```sh
    $ git clone git@github.com:Dakavon/truffle-hardhat-vagrant-env.git
    ```

    2. Go into the download folder and prepare development environment with
    ```sh
    $ cd truffle-hardhat-vagrant-env
    $ vagrant up
    ```

3. [Wait](https://www.youtube.com/watch?v=VBlFHuCzPgY) until it is finished :)

4. The Vagrant VM is now running. To shut it down, you can enter the following:
    ```sh
    $ vagrant halt
    ```

### Run development environment

1. If you haven't already create a DAPPS folder within your users home folder

2. Open VM installation folder in a terminal

3. Start VM and log in
    ```sh
    $ vagrant up && vagrant ssh
    ```

4. Go to ~DAPPS folder inside the VM
    ```sh
    vagrant@devVM:~$  cd ~/DAPPS/
    ```

5. Clone `INSERT_REPOSITORY` to your DAPPS folder (likely from outside the VM due to public-key authentication)
    ```sh
    $ git clone git@github.com:INSERT_REPOSITORY
    ```

6. Go to project folder inside the VM and install dependencies via
    ```sh
    vagrant@devVM:~/DAPPS$  cd INSERT_REPOSITORY && npm install
    ```