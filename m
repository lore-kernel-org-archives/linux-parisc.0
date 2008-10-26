From: Helge Deller <deller@gmx.de>
Subject: Linux 2.6.28-rc1: slab error in cache_alloc_debugcheck_after()
Date: Sun, 26 Oct 2008 21:14:23 +0100
Message-ID: <4904CF9F.8060405@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Just tried 2.6.28-rc1:
....
usbcore: registered new interface driver usbhid
usbhid: v2.6:USB HID core driver
TCP cubic registered
NET: Registered protocol family 17
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
rtc-parisc rtc-parisc: setting system clock to 2008-10-26 19:59:18 UTC 
(1225051158)
usb 1-1: new low speed USB device using ohci_hcd and address 2
usb 1-1: configuration #1 chosen from 1 choice
input: Logitech N48 as /class/input/input0
generic-usb 0003:046D:C001.0001: input,hidraw0: USB HID v1.00 Mouse 
[Logitech N48] on usb-0000:00:0e.2-1/inpu0
usb 1-1: New USB device found, idVendor=046d, idProduct=c001
usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
usb 1-1: Product: N48
usb 1-1: Manufacturer: Logitech
usb 1-2: new low speed USB device using ohci_hcd and address 3
usb 1-2: configuration #1 chosen from 1 choice
slab error in cache_alloc_debugcheck_after(): cache `size-512': double 
free, or memory outside object was oven
Backtrace:
  [<101a5724>] cache_alloc_debugcheck_after+0xd8/0x200
  [<101a5cac>] kmem_cache_alloc+0x1a0/0x1e8
  [<1042e294>] hid_register_report+0x60/0xc4
  [<1042e5f8>] hid_add_field+0x40/0x1a4
  [<1042ec40>] hid_parser_main+0x94/0xc4
Slab corruption: size-512 start=8f1ac768, len=512
Redzone: 0x9f911029d74e35b/0x0.
Last user: [<00000000>](0x0)
190: 6b 6b 6b 6b 6b 6b 6b 6b 00 00 00 00 00 00 00 00
1a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
1b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
1c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
1d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
1e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
Prev obj: start=8f1ac550, len=512
Redzone: 0x9f911029d74e35b/0x9f911029d74e35b.
Last user: [<00000000>](0x0)
000: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
010: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
Next obj: start=8f1ac980, len=512
Redzone: 0x0/0x9f911029d74e35b.
Last user: [<1042e294>](hid_register_report+0x60/0xc4)
000: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a
010: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a
slab error in cache_alloc_debugcheck_after(): cache `size-512': double 
free, or memory outside object was oven
Backtrace:
  [<101a5724>] cache_alloc_debugcheck_after+0xd8/0x200
  [<101a6184>] __kmalloc_track_caller+0x1e4/0x230
  [<10456778>] __alloc_skb+0x78/0x264
  [<10456a54>] dev_alloc_skb+0x1c/0x44
  [<103424a0>] tulip_rx+0x1f8/0x3f4
  [<10342804>] tulip_interrupt+0x168/0xab0
  [<10172758>] handle_IRQ_event+0x44/0x8c
  [<101728e8>] __do_IRQ+0x148/0x1c8
  [<1011517c>] do_cpu_irq_mask+0x194/0x204
  [<10118068>] intr_return+0x0/0x4
  [<10110958>] _spin_unlock_irqrestore+0x10/0x20
  [<10146e30>] __do_softirq+0x80/0x19c
  [<1019f9d8>] shmem_swp_alloc+0x208/0x248
  [<101bf378>] dispose_list+0x7c/0x138
  [<10110958>] _spin_unlock_irqrestore+0x10/0x20
  [<10172758>] handle_IRQ_event+0x44/0x8c

8f1ac760: redzone 1:0x9f911029d74e35b, redzone 2:0x0
  [<1042ef48>] hid_parse_report+0xc8/0x14c
  [<1044d4f0>] usbhid_parse+0x1dc/0x220
  [<104300d0>] hid_device_probe+0x74/0xec
  [<10336430>] really_probe+0x10c/0x20c
  [<103365ac>] driver_probe_device+0x5c/0x78
  [<103353b4>] bus_for_each_drv+0x54/0x9c
  [<1033663c>] device_attach+0x5c/0x80
  [<1033557c>] bus_attach_device+0x2c/0x68
  [<1033396c>] device_add+0x150/0x294
  [<104303d4>] hid_add_device+0xe8/0x10c
  [<1044dce8>] hid_probe+0x1a8/0x208

8f1ac978: redzone 1:0x0, redzone 2:0x9f911029d74e35b
Slab corruption: size-4096 start=8f1a9000, len=4096
040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
Sending BOOTP requests .<6>input: SILITEK USB Keyboard and Mouse as 
/class/input/input1
  OK
eth0: Setting full-duplex based on MII#1 link partner capability of 45e1.
Slab corruption: size-512 start=8f1ac550, len=512
Redzone: 0x9f911029d74e35b/0x9f911029d74e35b.
Last user: [<00000000>](0x0)
130: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
140: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
150: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
160: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
Prev obj: start=8f1ac338, len=512
Redzone: 0x9f911029d74e35b/0x9f911029d74e35b.
Last user: [<10456f00>](__kfree_skb+0x10/0x24)
000: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
010: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
Next obj: start=8f1ac768, len=512
Redzone: 0xd84156c5635688c0/0xd84156c5635688c0.
Last user: [<1042e294>](hid_register_report+0x60/0xc4)
000: 8f 13 a4 3c 8f 13 a4 3c 00 00 00 00 00 00 00 01
010: 8f 97 11 88 00 00 00 00 00 00 00 00 00 00 00 00
Slab corruption: size-32 start=8f1aa590, len=32
Redzone: 0x0/0x0.
Last user: [<00000000>](0x0)
000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
Prev obj: start=8f1aa558, len=32
Redzone: 0x0/0x0.
Last user: [<00000000>](0x0)
000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
Next obj: start=8f1aa5c8, len=32
Redzone: 0xd84156c5635688c0/0xd84156c5635688c0.
Last user: [<101ffd90>](sysfs_new_dirent+0x40/0x1a4)
000: 73 75 62 73 79 73 74 65 6d 00 5a 5a 5a 5a 5a 5a
010: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a a5
slab error in cache_alloc_debugcheck_after(): cache `size-32': double 
free, or memory outside object was overn
Backtrace:
  [<101a5724>] cache_alloc_debugcheck_after+0xd8/0x200
  [<101a5f54>] __kmalloc+0x1e4/0x230
  [<102c2f9c>] kobject_get_path+0x3c/0x74
  [<102c3d64>] kobject_uevent_env+0x100/0x3c8
  [<10333964>] device_add+0x148/0x294
  [<10333e64>] device_create_vargs+0x98/0xd0
  [<10333ec8>] device_create+0x2c/0x38
  [<1043fdbc>] hidraw_connect+0xec/0x170
  [<1042fe00>] hid_connect+0xa4/0x28c
  [<1043010c>] hid_device_probe+0xb0/0xec
  [<10336430>] really_probe+0x10c/0x20c
  [<103365ac>] driver_probe_device+0x5c/0x78
  [<103353b4>] bus_for_each_drv+0x54/0x9c
  [<1033663c>] device_attach+0x5c/0x80
  [<1033557c>] bus_attach_device+0x2c/0x68
  [<1033396c>] device_add+0x150/0x294

8f1aa588: redzone 1:0x0, redzone 2:0x0
Slab corruption: size-64 start=8f139188, len=64
Redzone: 0x0/0x9f911029d74e35b.
Last user: [<00000000>](0x0)
000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
030: 00 00 00 00 00 00 00 00 6b 6b 6b 6b 6b 6b 6b a5
Prev obj: start=8f139130, len=64
Redzone: 0x9f911029d74e35b/0x9f911029d74e35b.
Last user: [<00000000>](0x0)
000: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
010: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
Next obj: start=8f1391e0, len=64
Redzone: 0xd84156c5635688c0/0xd84156c5635688c0.
Last user: [<1043fd04>](hidraw_connect+0x34/0x170)
000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
slab error in cache_alloc_debugcheck_after(): cache `size-64': double 
free, or memory outside object was overn
Backtrace:
  [<101a5724>] cache_alloc_debugcheck_after+0xd8/0x200
  [<101a5cac>] kmem_cache_alloc+0x1a0/0x1e8
  [<101550c0>] call_usermodehelper_setup+0x30/0x70
  [<102c3fc8>] kobject_uevent_env+0x364/0x3c8
  [<10333964>] device_add+0x148/0x294
  [<10333e64>] device_create_vargs+0x98/0xd0
  [<10333ec8>] device_create+0x2c/0x38
  [<1043fdbc>] hidraw_connect+0xec/0x170
  [<1042fe00>] hid_connect+0xa4/0x28c
  [<1043010c>] hid_device_probe+0xb0/0xec
  [<10336430>] really_probe+0x10c/0x20c
  [<103365ac>] driver_probe_device+0x5c/0x78
  [<103353b4>] bus_for_each_drv+0x54/0x9c
  [<1033663c>] device_attach+0x5c/0x80
  [<1033557c>] bus_attach_device+0x2c/0x68
  [<1033396c>] device_add+0x150/0x294

8f139180: redzone 1:0x0, redzone 2:0x9f911029d74e35b
generic-usb 0003:047B:0002.0002: input,hidraw1: USB HID v1.00 Keyboard 
[SILITEK USB Keyboard and Mouse] on us0
Slab corruption: size-32 start=8f1aa558, len=32
Redzone: 0x0/0x0.
Last user: [<00000000>](0x0)
000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
Prev obj: start=8f1aa520, len=32
Redzone: 0x9f911029d74e35b/0x0.
Last user: [<00000000>](0x0)
000: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
010: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5
Next obj: start=8f1aa590, len=32
Redzone: 0xd84156c5635688c0/0xd84156c5635688c0.
Last user: [<102ccb7c>](kvasprintf+0x44/0x84)
000: 75 73 62 64 65 76 31 2e 33 5f 65 70 38 31 00 5a
010: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a a5
slab error in cache_alloc_debugcheck_after(): cache `size-32': double 
free, or memory outside object was overn
Backtrace:
  [<101a5724>] cache_alloc_debugcheck_after+0xd8/0x200
  [<101a6184>] __kmalloc_track_caller+0x1e4/0x230
  [<10188b70>] kstrdup+0x44/0x7c
  [<101ffd90>] sysfs_new_dirent+0x40/0x1a4
  [<10200594>] create_dir+0x38/0x124
  [<102006f0>] sysfs_create_dir+0x48/0x68
  [<102c2e6c>] create_dir+0x24/0x60
  [<102c3168>] kobject_add_internal+0x80/0x104
  [<102c33e0>] kobject_add+0x5c/0x68
  [<10333898>] device_add+0x7c/0x294
  [<103ceb60>] usb_create_ep_files+0x10c/0x198
  [<103ce3e0>] usb_create_sysfs_intf_files+0x90/0xc8
  [<103cb038>] usb_set_configuration+0x3b4/0x3f4
  [<103d24fc>] generic_probe+0x64/0xb4
  [<103cb43c>] usb_probe_device+0x48/0x54
  [<10336430>] really_probe+0x10c/0x20c

8f1aa550: redzone 1:0x0, redzone 2:0x0
slab error in cache_alloc_debugcheck_after(): cache `size-32': double 
free, or memory outside object was overn
Backtrace:
  [<101a5724>] cache_alloc_debugcheck_after+0xd8/0x200
  [<101a6184>] __kmalloc_track_caller+0x1e4/0x230
  [<10188b70>] kstrdup+0x44/0x7c
  [<101ffd90>] sysfs_new_dirent+0x40/0x1a4
  [<10201130>] sysfs_do_create_link+0x134/0x2c8
  [<103337ac>] device_create_sys_dev_entry+0x50/0x64
  [<10333920>] device_add+0x104/0x294
  [<103ceb60>] usb_create_ep_files+0x10c/0x198
  [<103ce3e0>] usb_create_sysfs_intf_files+0x90/0xc8
  [<103cb038>] usb_set_configuration+0x3b4/0x3f4
  [<103d24fc>] generic_probe+0x64/0xb4
  [<103cb43c>] usb_probe_device+0x48/0x54
  [<10336430>] really_probe+0x10c/0x20c
  [<103365ac>] driver_probe_device+0x5c/0x78
  [<103353b4>] bus_for_each_drv+0x54/0x9c
  [<1033663c>] device_attach+0x5c/0x80

8f1aa518: redzone 1:0x9f911029d74e35b, redzone 2:0x0
Slab corruption: size-32 start=8f1aa4e8, len=32
Redzone: 0x0/0x9f911029d74e35b.
Last user: [<00000000>](0x0)
000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
010: 00 00 00 00 00 00 00 00 6b 6b 6b 6b 6b 6b 6b a5
Prev obj: start=8f1aa4b0, len=32
Redzone: 0x9f911029d74e35b/0x0.
Last user: [<00000000>](0x0)
000: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
Next obj: start=8f1aa520, len=32
Redzone: 0xd84156c5635688c0/0xd84156c5635688c0.
Last user: [<101ffd90>](sysfs_new_dirent+0x40/0x1a4)
000: 32 35 32 3a 34 00 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a
010: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a a5
slab error in cache_alloc_debugcheck_after(): cache `size-32': double 
free, or memory outside object was overn
Backtrace:
  [<101a5724>] cache_alloc_debugcheck_after+0xd8/0x200
  [<101a6184>] __kmalloc_track_caller+0x1e4/0x230
  [<10188b70>] kstrdup+0x44/0x7c
  [<101ffd90>] sysfs_new_dirent+0x40/0x1a4
  [<10201130>] sysfs_do_create_link+0x134/0x2c8
  [<103334b8>] device_add_class_symlinks+0x4c/0x1c4
  [<10333930>] device_add+0x114/0x294
  [<103ceb60>] usb_create_ep_files+0x10c/0x198
  [<103ce3e0>] usb_create_sysfs_intf_files+0x90/0xc8
  [<103cb038>] usb_set_configuration+0x3b4/0x3f4
  [<103d24fc>] generic_probe+0x64/0xb4
  [<103cb43c>] usb_probe_device+0x48/0x54
  [<10336430>] really_probe+0x10c/0x20c
  [<103365ac>] driver_probe_device+0x5c/0x78
  [<103353b4>] bus_for_each_drv+0x54/0x9c
  [<1033663c>] device_attach+0x5c/0x80

8f1aa4e0: redzone 1:0x0, redzone 2:0x9f911029d74e35b
Slab corruption: size-32 start=8f1aa4b0, len=32
Redzone: 0x9f911029d74e35b/0x0.
Last user: [<00000000>](0x0)
010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
Prev obj: start=8f1aa478, len=32
Redzone: 0xd84156c5635688c0/0xd84156c5635688c0.
Last user: [<101ffd90>](sysfs_new_dirent+0x40/0x1a4)
000: 62 75 73 00 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a
010: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a a5
Next obj: start=8f1aa4e8, len=32
Redzone: 0xd84156c5635688c0/0xd84156c5635688c0.
Last user: [<101ffd90>](sysfs_new_dirent+0x40/0x1a4)
000: 73 75 62 73 79 73 74 65 6d 00 5a 5a 5a 5a 5a 5a
010: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a a5
slab error in cache_alloc_debugcheck_after(): cache `size-32': double 
free, or memory outside object was overn
Backtrace:
  [<101a5724>] cache_alloc_debugcheck_after+0xd8/0x200
  [<101a6184>] __kmalloc_track_caller+0x1e4/0x230
  [<10188b70>] kstrdup+0x44/0x7c
  [<101ffd90>] sysfs_new_dirent+0x40/0x1a4
  [<10201130>] sysfs_do_create_link+0x134/0x2c8
  [<10333568>] device_add_class_symlinks+0xfc/0x1c4
  [<10333930>] device_add+0x114/0x294
  [<103ceb60>] usb_create_ep_files+0x10c/0x198
  [<103ce3e0>] usb_create_sysfs_intf_files+0x90/0xc8
  [<103cb038>] usb_set_configuration+0x3b4/0x3f4
  [<103d24fc>] generic_probe+0x64/0xb4
  [<103cb43c>] usb_probe_device+0x48/0x54
  [<10336430>] really_probe+0x10c/0x20c
  [<103365ac>] driver_probe_device+0x5c/0x78
  [<103353b4>] bus_for_each_drv+0x54/0x9c
  [<1033663c>] device_attach+0x5c/0x80

8f1aa4a8: redzone 1:0x9f911029d74e35b, redzone 2:0x0
usbcore: bogus descriptor, type 0 length 0
usb 1-2: New USB device found, idVendor=047b, idProduct=0002
usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
usb 1-2: Product: USB Keyboard and Mouse
usb 1-2: Manufacturer: SILITEK
IP-Config: Got BOOTP answer from 192.168.178.50, my address is 
192.168.178.70
slab error in verify_redzone_free(): cache `skbuff_head_cache': memory 
outside object was overwritten
Backtrace:
  [<101a51dc>] cache_free_debugcheck+0x18c/0x29c
  [<101a6218>] kmem_cache_free+0x48/0x194
  [<10346034>] tulip_close+0x164/0x1ec
  [<1045ed80>] dev_close+0xf8/0x120
  [<10462510>] dev_change_flags+0xb8/0x194
  [<107562bc>] ic_close_devs+0x44/0x6c
  [<10757854>] ip_auto_config+0x144/0x2e4
  [<101111ac>] do_one_initcall+0x70/0x190
  [<107361d0>] do_initcalls+0x30/0x4c
  [<107362f8>] kernel_init+0x8c/0xd4
  [<10117c5c>] ret_from_kernel_thread+0x1c/0x24

8f1af250: redzone 1:0x0, redzone 2:0xd84156c5635688c0.
slab error in verify_redzone_free(): cache `skbuff_head_cache': memory 
outside object was overwritten
Backtrace:
  [<101a51dc>] cache_free_debugcheck+0x18c/0x29c
  [<101a6218>] kmem_cache_free+0x48/0x194
  [<10346034>] tulip_close+0x164/0x1ec
  [<1045ed80>] dev_close+0xf8/0x120
  [<10462510>] dev_change_flags+0xb8/0x194
  [<107562bc>] ic_close_devs+0x44/0x6c
  [<10757854>] ip_auto_config+0x144/0x2e4
  [<101111ac>] do_one_initcall+0x70/0x190
  [<107361d0>] do_initcalls+0x30/0x4c
  [<107362f8>] kernel_init+0x8c/0xd4
  [<10117c5c>] ret_from_kernel_thread+0x1c/0x24

8f1af190: redzone 1:0xd84156c5635688c0, redzone 2:0x0.
IP-Config: Complete:
      device=eth0, addr=192.168.178.70, mask=255.255.255.0, 
gw=192.168.178.1,
      host=c3000, domain=box, nis-domain=(none),
      bootserver=192.168.178.50, rootserver=192.168.178.50, rootpath=
md: Skipping autodetection of RAID arrays. (raid=autodetect will force)
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: <0>------------[ cut here ]------------
Badness at kernel/smp.c:332

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001110 Not tainted
r00-03  0004ff0e 10672280 10148060 106daa80
r04-07  101130d8 00000000 00000001 00000000
r08-11  101130d8 00000000 106d4280 10102398
r12-15  1077aa80 10671280 00000000 f0400004
r16-19  f0000884 f000017c f0000174 fffffff1
r20-23  00000000 1077c000 00000000 00000001
r24-27  00000000 101130d8 00000001 10671280
r28-31  10734000 000002ee 8f82c280 10120f48
sr00-03  00000000 00000000 00000000 00000000
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1016bb18 1016bb1c
  IIR: 03ffe01f    ISR: 102401fe  IOR: 0b02c19c
  CPU:        0   CR30: 8f82c000 CR31: d20344f0
  ORIG_R28: 10686bdc
  IAOQ[0]: smp_call_function_mask+0x44/0x234
  IAOQ[1]: smp_call_function_mask+0x48/0x234
  RP(r2): on_each_cpu+0x1c/0x50
Backtrace:
  [<10148060>] on_each_cpu+0x1c/0x50
  [<10111748>] free_initmem+0x4c/0x230
  [<10111310>] init_post+0x10/0x100
  [<1073632c>] kernel_init+0xc0/0xd4

288k freed
slab: Internal list corruption detected in cache 'sysfs_dir_cache'(53), 
slabp 8f125000(16). Hexdump:

000: 00 10 01 00 00 20 02 00 00 00 00 f0 8f 12 50 f0
010: 00 00 00 10 00 00 00 10 00 00 00 00 ff ff ff fe
020: ff ff ff fe ff ff ff fe ff ff ff fe ff ff ff fd
030: ff ff ff fd ff ff ff fd ff ff ff fd ff ff ff fd
040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
080: 00 00 00 1a 00 00 00 1b 00 00 00 1c 00 00 00 1d
090: 00 00 00 1e 00 00 00 1f 00 00 00 20 00 00 00 21
0a0: 00 00 00 22 00 00 00 23 00 00 00 24 00 00 00 25
0b0: 00 00 00 26 00 00 00 27 00 00 00 28 00 00 00 29
0c0: 00 00 00 2a 00 00 00 2b 00 00 00 2c 00 00 00 2d
0d0: 00 00 00 2e 00 00 00 2f 00 00 00 30 00 00 00 31
0e0: 00 00 00 32 00 00 00 33 00 00 00 34 ff ff ff ff
------------[ cut here ]------------
kernel BUG at mm/slab.c:2941!

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000100001110 Tainted: G        W
r00-03  0004010e 1068722c 101a53cc 000000f0
r04-07  8f8081c0 8f125000 00000002 8f1250f0
r08-11  8f809420 00000000 106d4280 1010e700
r12-15  1077aa80 10671280 00000000 f0400004
r16-19  f0000884 f000017c f0000174 1068722c
r20-23  1077aa64 00000000 000092a0 1032a2d8
r24-27  ffffffff 105d95f0 10687294 10671280
r28-31  00000001 000002ee 8f8603c0 10120f48
sr00-03  00000000 00000000 00000000 00000000
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 101a53cc 101a53d0
  IIR: 03ffe01f    ISR: 10240001  IOR: a1e872a0
  CPU:        0   CR30: 8f860000 CR31: d20344f0
  ORIG_R28: 00000000
  IAOQ[0]: check_slabp+0xe0/0xf8
  IAOQ[1]: check_slabp+0xe4/0xf8
  RP(r2): check_slabp+0xe0/0xf8
Backtrace:
  [<101a590c>] free_block+0xc0/0x188
  [<101a6a7c>] drain_array+0xa4/0x108
  [<101a6b60>] cache_reap+0x80/0x15c
  [<10155904>] run_workqueue+0x124/0x1d4
  [<10155a38>] worker_thread+0x84/0xf8
  [<1015a168>] kthread+0x5c/0xa0
  [<10117c5c>] ret_from_kernel_thread+0x1c/0x24

Backtrace:
  [<10113db8>] die_if_kernel+0x130/0x1a0
  [<10113f18>] handle_break+0x8c/0xf0
  [<101147a0>] handle_interruption+0x570/0x58c
  [<10118078>] intr_check_sig+0x0/0x34
  [<101107b8>] _spin_lock_irqsave+0x14/0x24
  [<101a53d0>] check_slabp+0xe4/0xf8
  [<1019f9d8>] shmem_swp_alloc+0x208/0x248
  [<101bf378>] dispose_list+0x7c/0x138
  [<1010e700>] schedule_timeout+0xb4/0xd8
  [<10303b0c>] soft_cursor+0x1c8/0x1f8
  [<10303870>] bit_cursor+0x50c/0x54c
  [<101a6b60>] cache_reap+0x80/0x15c
  [<10155904>] run_workqueue+0x124/0x1d4
  [<10155a38>] worker_thread+0x84/0xf8
  [<1015a168>] kthread+0x5c/0xa0
  [<10117c5c>] ret_from_kernel_thread+0x1c/0x24

Slab corruption: size-32 start=8f121558, len=32
Redzone: 0x0/0x0.
Last user: [<00000000>](0x0)
000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
Prev obj: start=8f121520, len=32
Redzone: 0x9f911029d74e35b/0x0.
Last user: [<00000000>](0x0)
000: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
010: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5
Next obj: start=8f121590, len=32
Redzone: 0xd84156c5635688c0/0xd84156c5635688c0.
Last user: [<101734f0>](request_irq+0x8c/0x12c)
000: 10 32 8b ec 00 00 00 00 00 00 00 00 10 5c 5a cc
010: 8f 13 90 d8 00 00 00 00 00 00 00 03 8f 12 09 78
slab error in cache_alloc_debugcheck_after(): cache `size-32': double 
free, or memory outside object was overn
Backtrace:
  [<101a5724>] cache_alloc_debugcheck_after+0xd8/0x200
  [<101a5f54>] __kmalloc+0x1e4/0x230
  [<101eb748>] load_elf_binary+0x26c/0xbfc
  [<101afda8>] search_binary_handler+0x13c/0x3a4
  [<101b0174>] do_execve+0x140/0x254
  [<1011ee84>] sys_execve+0x40/0xa4
  [<10117c84>] __execve+0x20/0x34
  [<101b529c>] may_open+0x94/0x214
  [<101a52c0>] cache_free_debugcheck+0x270/0x29c
  [<101a6218>] kmem_cache_free+0x48/0x194
  [<101a8f38>] fd_install+0x38/0x7c
  [<101b7c24>] sys_dup+0x44/0x58
  [<101113cc>] init_post+0xcc/0x100

8f121550: redzone 1:0x0, redzone 2:0x0
slab error in cache_alloc_debugcheck_after(): cache `size-32': double 
free, or memory outside object was overn
Backtrace:
  [<101a5724>] cache_alloc_debugcheck_after+0xd8/0x200
  [<101a5cac>] kmem_cache_alloc+0x1a0/0x1e8
  [<101f1d04>] proc_reg_open+0x44/0x134
  [<101a8a7c>] __dentry_open+0x220/0x3b0
  [<101a8db8>] nameidata_to_filp+0x30/0x50
  [<101b5818>] do_filp_open+0x2f4/0x73c
  [<101a8fec>] do_sys_open+0x70/0x120
  [<101190c0>] syscall_exit+0x0/0x28

8f121518: redzone 1:0x9f911029d74e35b, redzone 2:0x0
Slab corruption: size-4096 start=8f127000, len=4096
440: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
450: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
460: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
470: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
7c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
7d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

