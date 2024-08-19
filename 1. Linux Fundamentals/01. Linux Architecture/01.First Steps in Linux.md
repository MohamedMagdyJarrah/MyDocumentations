# Why an Operating System at All?
    Let’s say you do not have an operating system (OS) available or cannot use one for whatever reason. You would then end up doing pretty much everything yourself:
    memory management, interrupt handling, talking with I/O devices, managing files, configuring and managing the network stack
    and the list goes on...

Technically speaking, an OS is not strictly needed. There are systems out there that do not have an OS. These are usually embedded systems with a tiny footprint: think of an IoT beacon. They simply do not have the resources available to keep anything else around other than one application. For example, with Rust you can use its Core and Standard Library to run any app on <span style="color:red"> bare metal</span>.

## Operating system 
Takes on all this undifferentiated heavy lifting, abstracting away the different hardware components and providing you with a (usually) clean and nicely designed Application Programming Interface (API), such as is the case with the Linux kernel.

We usually call these APIs that an OS exposes system calls, or syscalls for short. 

All of this allows you to focus on the business logic rather than having to manage the resources yourself, and also takes care of the different hardware you want to run your app on.

### For example:
    Let’s say we want to identify (and print) the ID of the current user.
First, we look at the Linux syscall <span style="color:green">**getuid()**</span> <br>
`getuid() returns the real user ID of the calling process.`

OK, so this getuid syscall is what we could use programmatically, from a library.
On the command line (shell), we would be using the equivalent id command that in turn uses the <span style="color:green">**getuid()**</span> syscall:<br>
```bash
    $ id --user
    638114
```

### Now that you have a basic idea of why using an operating system, in most cases, makes sense