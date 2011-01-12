From: Alex Vladimirovich <porebrik@junkemail.ru>
Subject: HP c8000 failure
Date: Wed, 12 Jan 2011 14:26:56 +0300
Message-ID: <BLU0-SMTP20449831E77AE6C75F0A2DBBFF10@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello PA-RISC Linux list!

Please reply back to me using <artem.falcon(at)gmail.com> address
instead, since porebrik@junkemail.ru is my junk mailbox for various
mail lists, and it's overflooded.

Is any technitian there who has some experience with failing c8000s?
I got oppressive "System Firmware Hang" according to diagnostic LEDs
on
rear panel.
Things that i already tried as well (and sorry for my english):
(not in right order, i've tried some of steps dozen of times):
1) Removed all the periphery (PCI cards, video card, HDDs);
2) Attached to serial port and used "COM Port Toolkit" software
to try send some values and sequences, but no replies from machine.
Settings were set following manual
(BCM led on the board blinks which means the BCM itself works);
3) Removed and swapped processors, swapped VRMs, tried to boot machine
with only 1 processor installed;
4) Checked the voltage of "CMOS" battery without and under the load,
removed it and installed back;
5) Removed additional memory, saved only two sticks;
6) Installed video card again, attached to it, attached USB keyboard,
same symptoms.
Can somebody suggest something else before i'll put this board into
trash
bin and try to get a new one?
Maybe someone knows the placement of firmware eeprom? Can he dump
raw contents from his chip?
Since there are many of c8000 geeks there, maybe any know any of
HP engineers/technitians?
Maybe some of you or they know some "magic" sequences or steps
which can be done before i will call this board a "brick" totally.

I also seen that there is Xilinx Spartan PLD chip on the board,
for what is it used for? Because it's known as relatively costly
solution for the vendor.

Thanks for any help!
