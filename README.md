# FileBridge

An iOS application which bridges the gap between an iDevice and iTunes file sharing.

## Join the beta
The beta can be accessed by using this [TestFlight link](https://testflight.apple.com/join/9Yvmc3jS)

## Why did I make this?
File sharing between an iPhone and iTunes has always been a hassle. It's really difficult to transfer one file over a USB cable since iOS doesn't readily show your filesystem inside iTunes.

Instead, iTunes shows application files and you have to use an application folder to transfer anything in iTunes. The main problem is that, there is no dedicated application to create a folder for file sharing and nothing else.

FileBridge solves this problem. It is an app which just allows you to share files through iTunes.

## Why not use 3rd party tools?

Most of these tools are from sketchy companies looking to make a quick buck. I am not sure what adware/malware these 3rd party tools can install and I'm not willing to take the risk even if there is no malware.

Also, the third party file management often makes the transferred files not show up in my iPhone. Therefore, I tend to use iTunes, the first party software, for all my iPhone needs.

## Initial Setup
When you open the app for the first time, you will be asked to close it. Take a look at your files folder, in the **On my iPhone** section.

You will see that there is no FileBridge folder. This is because there is nothing within the folder and it's invisible.

To make the FileBridge folder show up on your phone:
1. Plug the device into your computer
2. Open iTunes
3. Navigate to file sharing
4. Click on `FileBridge`
5. Put any file/folder in the blank space that shows the app's documents
6. Check your iphone's files app and you should see the FileBridge folder

A blank text file will be automatically added in a future app version which automates this setup process.

## PseudoFS
PseudoFS is a feature that shifts your iPhone's documents into the FileBridge folder for even easier file transfer. This makes your phone's filesystem similar to Android phones where the user can see all the internal storage directories on the PC file explorer (which is iTunes in this case).

Follow the instructions in the PseudoFS tab for enabling this feature and transfer files like normal after setup is complete.

DISCLAIMER: I am not responsible if you lose data with this feature. There are plenty of safeguards and warnings to prevent that from happening. The only way data can possibly be lost is if you uninstall the app and the copy safety switch was switched off. 

## Planned features
Here are features that I have planned for future releases (these are also in the issues)
- Add informational buttons so the app is easier to use
- Add a how-to guide for transferring various types of files and how to optimize the iDevice for easy FileBridge transfer

## Contribution
If you have issues with the app:

-   Describe the issue in detail
-   If you have a feature request, please indicate it as so. Planned features are in a different section of the README, so be sure to read those before submitting.

# Developers and Permissions

I try to make comments/commits as detailed as possible, but if you don't understand something, please contact me via Discord or Twitter! I'm always happy to talk!

Creator/Developer: Brian Dashore

Developer Twitter: [@kingbri1st](https://twitter.com/kingbri1st)

Developer Discord: kingbri#6666

Join the support discord here (get the king-updates role to access the channel): [https://discord.gg/pswt7by](https://discord.gg/pswt7by)
