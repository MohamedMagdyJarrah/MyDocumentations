# What is a Computer Network?
A computer network is a system of interconnected computers and other devices (like printers, servers, and smartphones) that communicate and share resources with each other. These devices are connected using communication channels such as cables (wired) or wireless signals (Wi-Fi, Bluetooth, etc.).

<br><br>

# Why Computer Networks Are Important:
1. Resource Sharing
    > Share files, software, hardware (like printers or scanners) across devices.
2. Communication
    > Email, instant messaging, video calls, and more are all made possible by networks.
3. Centralized Data Management
    > Servers can manage data and applications centrally, improving security and efficiency.
4. Remote Access
    > Allows users to access data and systems from different locations.
5. Cost Efficiency
    > Sharing resources reduces the need for duplicate equipment or software.
6. Scalability and Flexibility
    > Easily add new devices or users to a network as your needs grow.

<br><br>

# Basic Components of a Network:
- `Nodes`: Device like computers, phones, printers, etc.
- `Transmission media`: Physical (like Ethernet cables) or wireless (like Wi-Fi).
- `Network interfaces`: Hardware (like network cards) that enable devices to connect.
- `Protocols`: Rules that define how data is transmitted (like TCP/IP).

<img src="images/01_IntroToNetworks/1.png" alt="alt text" width="400"/>

<br><br>

# Network Types:
### 1. 🌍 Geographical Area
- `LAN`, `WLAN (Wireless)`: Local Area Network which covers a small area like a room, building, or campus.<br>
<img src="images/01_IntroToNetworks/2.png" alt="alt text" width="400"/> <img src="images/01_IntroToNetworks/3.png" alt="alt text" width="380"/>

- `CAN`: Campus Area Network which interconnect multiple local area networks (LAN) within an educational or corporate campus.<br>
<img src="images/01_IntroToNetworks/4.png" alt="alt text" width="400"/>

- `MAN`: Metropolitan Area Network which spans a city or large campus; connects multiple LANs. (City-wide network for a college).<br>
<img src="images/01_IntroToNetworks/5.png" alt="alt text" width="400"/>


- `WAN`: Wide Area Network which connect multiple LANs with large distances between them (cities, countries, continents).<br>
<img src="images/01_IntroToNetworks/6.png" alt="alt text" width="400"/>


### 2. 🖥️ Host Role
- `Peer-to-Peer (P2P)`: All devices are equal; each one can act as both client and server.(`Example`: File sharing systems like BitTorrent)<br>
<img src="images/01_IntroToNetworks/7.png" alt="alt text" width="300"/>

- `Client-Server`: Devices are divided into clients (ask for services) and servers (provide services).(`Example`: Web server and browser, email system)<br>
<img src="images/01_IntroToNetworks/8.png" alt="alt text" width="300"/>


# Network Topologies:
Network topology is the layout or structure of a network, including how computers, cables, routers, and other devices are connected and communicate.<br>
There are two types of topology:<br>
- `Physical Topology `– actual layout of devices and cables.
- `Logical Topology` – how data flows through the network regardless of physical design.<br>
<img src="images/01_IntroToNetworks/9.png" alt="alt text" width="400"/>

## 🕸️ Common Types of Network Topologies
### 1. Bus Topology
<img src="images/01_IntroToNetworks/10.png" alt="alt text" width="400"/><br>

📌 **Structure**: All devices are connected to a single central cable (called the “bus” or “backbone”), and the node will be broadcast the message and only the one who care for the message will recieve it.<br>
**Advantages**:<br>
- Easy to set up for small networks.
- Requires less cable than star topology.
- Cost-effective.<br>

**Disadvantages**:<br>
- Entire network fails if the bus fails.
- Slower performance with more devices.
- Troubleshooting is difficult.

### 2. Ring Topology
<img src="images/01_IntroToNetworks/11.png" alt="alt text" width="400"/><br>

📌 **Structure**: Each device is connected to two others, forming a circular data path.<br>
**Advantages**:<br>
- Data flows in one direction, reducing collisions.
- Good performance for moderate-sized networks.<br>

**Disadvantages**:<br>
- One failure can disrupt the entire network.
- Difficult to add or remove devices.
- Troubleshooting is harder.

### 3. Mesh Topology
<img src="images/01_IntroToNetworks/12.png" alt="alt text" width="400"/><br>

📌 **Structure**: Every device is connected to every other device (fully connected mesh), or some devices are interconnected (partial mesh).<br>
**Advantages**:<br>
- Very reliable – one failure doesn't affect the network.
- High fault tolerance and redundancy.
- Good security and privacy.<br>

**Disadvantages**:<br>
- Very expensive (lots of cables and ports).
- Complex to set up and manage.
- Requires lots of configuration.

### 4. Star Topology
<img src="images/01_IntroToNetworks/13.png" alt="alt text" width="400"/><br>

📌 **Structure**: All devices are connected to a central device (switch or hub).<br>
**Advantages**:<br>
- Easy to install and manage.
- One device failure doesn’t affect others.
- Easy to detect faults.<br>

**Disadvantages**:<br>
- If the central device fails, the whole network goes down.
- Requires more cable.
- More expensive than bus topology.

