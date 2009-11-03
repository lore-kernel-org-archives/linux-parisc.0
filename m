From: Helge Deller <deller@gmx.de>
Subject: Re: Out of order unwind entry warning
Date: Tue, 03 Nov 2009 22:10:37 +0100
Message-ID: <4AF09C4D.5030600@gmx.de>
References: <20091102232324.AAFFF4E38@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	carlos@systemhalted.org, randolph@tausq.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091102232324.AAFFF4E38@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11/03/2009 12:23 AM, John David Anglin wrote:
>> On 11/02/2009 11:20 PM, Helge Deller wrote:
>> sadly I answered too early....
>> With 64bit kernel I get those unwind warnings again with nearly all kernel modules now:
>> WARNING: Out of order unwind entry! 0000000000d4ad40 and 0000000000d4ad50
>
> What's readelf say?

"modprobe libcrc32c" gives in dmesg:
WARNING: Out of order unwind entry! 0020d0e8 and 0020d0f8

[deller@p100 linus-linux-2.6-32bit]$ /opt/cross-hppa-4.4.neu/bin/hppa-linux-readelf -u lib/libcrc32c.ko

Unwind section '.PARISC.unwind' at offset 0x11c contains 3 entries:

<libcrc32c_mod_fini>: [0x0-0x2c]
         Entry_GR=1 Save_SP Save_RP Total_frame_size=8
<libcrc32c_mod_init>: [0x0-0x44]
         Entry_GR=1 Save_SP Save_RP Total_frame_size=8
<crc32c>: [0x0-0x6c]
         Entry_GR=2 Save_SP Save_RP Total_frame_size=8
