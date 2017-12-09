From: Helge Deller <deller@gmx.de>
Subject: Re: Have my PA8800 back online...
Date: Sat, 9 Dec 2017 22:03:00 +0100
Message-ID: <ccca0165-6c4a-97f3-2e0b-00657948c775@gmx.de>
References: <2ADB5C8A-DFEB-4CA5-92BA-96E459A3575E@bell.net>
 <8314a5d6-7df7-3282-0d91-a9b414a122e0@web.de>
 <526274E4-88D8-4DF8-8F74-5B775186BBEC@bell.net>
 <cc22ee64-e9f3-aeb4-a9a0-a503f20f9634@web.de>
 <48320506-f7fa-822b-fb45-40eab1dbda02@bell.net>
 <17707adb-4f71-1d66-2a19-3cdfaff047f3@gmx.de>
 <53815372-58e8-70e2-bab4-1777e848cf5e@web.de>
 <79c110ec-2975-a827-4b9d-1351ab77779b@gmx.de>
 <d3c1e035-6486-c0b5-e87a-22d26c0c95f5@bell.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------3C1AED33775088403FE66C0B"
Cc: debian-hppa@lists.debian.org
To: John David Anglin <dave.anglin@bell.net>,
        Frank Scheiner <frank.scheiner@web.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <d3c1e035-6486-c0b5-e87a-22d26c0c95f5@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------3C1AED33775088403FE66C0B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 08.12.2017 23:14, John David Anglin wrote:
> On 2017-12-08 4:29 PM, Helge Deller wrote:
>>> root@rp3440:~# lspci -nn
>>> [...]
>>> e0:01.0 Communication controller [0780]: Hewlett-Packard Company Auxiliary Diva Serial Port [103c:1290] (rev 01)
>>> e0:01.1 Serial controller [0700]: Hewlett-Packard Company Diva Serial [GSP] Multiport UART [103c:1048] (rev 03)
>>>
>>> Interesting - actually the current situation looks like what [your patch from May 29th] should have accomplished. But as you dropped it in favor of a patch to palo, it seems to be unrelated.
>>>
>>> [your patch from May 29th]:https://patchwork.kernel.org/patch/9753613/
>> The patch had some other issues which is why I dropped it.
>> I like the testing of the class id much more, as it's done by the current upstream code.
>> E.g. this diva port reports PCI_CLASS_COMMUNICATION_OTHER as PCI CLASS ID, which differs to what the serial port driver should handle.
>>
> Yes, you previously noted that this port has no external connector or access via Ethernet.  I suspect it talks to some internal module.
> I don't know if there's any reason to access the device it's connected to (if any).  It probably should be "ttyO0".
> 
> Although the renumbering of the serial ports is somewhat annoying

Yes, it's really annoying.
Especially right now, where all kernels >= 4.14 need ttyS0, while older onese require ttyS1 as boot console. 
It's confusing.

> maybe palo change should be reverted so default is always ttyS0

Yes, agreed.
With the current situation we are not better with preselecting ttyS1 on rp34x0 machines.

> I would like the enumeration of the RV100 port skipped as the implementation on the rp34xx machines is broken and can't be used.

The RV100 port refers here to the built-in ATI Radeon 7000 graphics card which is part of Diva management card.
It's not working on rp34x0 machines. 

> It's enumeration means one has to explicitly specify the console argument in the boot command line as there seems to no way to
> prefer the serial console port.

Can you please try attached patch which disables the serial MUX and ATI card?
If it works for you and if we backport it to all kernels and if we revert palo to use ttyS0 for all machines we might be good.

Helge

--------------3C1AED33775088403FE66C0B
Content-Type: text/plain; charset=UTF-8;
 name="p1"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="p1"

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGFyaXNjL2xiYV9wY2kuYyBiL2RyaXZlcnMvcGFyaXNj
L2xiYV9wY2kuYwppbmRleCBhMjVmZWQ1MmY3ZTkuLjhlNDI4MjdkM2MyNyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9wYXJpc2MvbGJhX3BjaS5jCisrKyBiL2RyaXZlcnMvcGFyaXNjL2xiYV9w
Y2kuYwpAQCAtMTY5MiwzICsxNjkyLDM5IEBAIHZvaWQgbGJhX3NldF9pcmVncyhzdHJ1Y3Qg
cGFyaXNjX2RldmljZSAqbGJhLCB1MzIgaWJhc2UsIHUzMiBpbWFzaykKIAlpb3VubWFwKGJh
c2VfYWRkcik7CiB9CiAKKworLyoKKyAqIFRoZSBkZXNpZ24gb2YgdGhlIERpdmEgbWFuYWdl
bWVudCBjYXJkIGluIHJwMzR4MCBtYWNoaW5lcyAocnAzNDEwLCBycDM0NDApCisgKiBzZWVt
cyBydXNoZWQsIHNvIHRoYXQgbWFueSBidWlsdC1pbiBjb21wb25lbnRzIHNpbXBseSBkb24n
dCB3b3JrLgorICogVGhlIGZvbGxvd2luZyBxdWlya3MgZGlzYWJsZSB0aGUgc2VyaWFsIEFV
WCBwb3J0IGFuZCB0aGUgYnVpbHQtaW4gQVRJIFJWMTAwCisgKiBSYWRlb24gNzAwMCBncmFw
aGljcyBjYXJkIHdoaWNoIGJvdGggZG9uJ3QgaGF2ZSBhbnkgZXh0ZXJuYWwgY29ubmVjdG9y
cyBhbmQKKyAqIHRodXMgYXJlIHVzZWxlc3MsIGFuZCBldmVuIHdvcnNlLCBlLmcuIHRoZSBB
VVggcG9ydHMgb2NjdXBpZXMgdHR5UzAgYW5kCisgKiBhcyBzdWNoIG1ha2VzIHRob3NlIG1h
Y2hpbmVzIHRoZSBvbmx5IFBBUklTQyBtYWNoaW5lcyBvbiB3aGljaCB3ZSBjYW4ndAorICog
dXNlIHR0eVMwIGFzIGJvb3QgY29uc29sZS4KKyAqLworc3RhdGljIHZvaWQgcXVpcmtfZGl2
YV9hdGlfY2FyZChzdHJ1Y3QgcGNpX2RldiAqZGV2KQoreworCS8qIHN1YnN5c3RlbSBJRHMg
YXJlIGZyb20gRGl2YSAqLworCWlmIChkZXYtPnN1YnN5c3RlbV92ZW5kb3IgIT0gUENJX1ZF
TkRPUl9JRF9IUCB8fAorCSAgICBkZXYtPnN1YnN5c3RlbV9kZXZpY2UgIT0gMHgxMjkyKQor
CQlyZXR1cm47CisKKwlkZXZfaW5mbyhkZXYsICJIaWRpbmcgRGl2YSBidWlsdC1pbiBBVEkg
Y2FyZC4iKTsKKwlkZXYtPmRldmljZSA9IDA7Cit9CitERUNMQVJFX1BDSV9GSVhVUF9IRUFE
RVIoUENJX1ZFTkRPUl9JRF9BVEksIFBDSV9ERVZJQ0VfSURfQVRJX1JBREVPTl9RWSwKKwlx
dWlya19kaXZhX2F0aV9jYXJkKTsKKworc3RhdGljIHZvaWQgcXVpcmtfZGl2YV9hdXhfZGlz
YWJsZShzdHJ1Y3QgcGNpX2RldiAqZGV2KQoreworCS8qIHN1YnN5c3RlbSBJRHMgYXJlIGZy
b20gRGl2YSAqLworCWlmIChkZXYtPnN1YnN5c3RlbV92ZW5kb3IgIT0gUENJX1ZFTkRPUl9J
RF9IUCB8fAorCSAgICBkZXYtPnN1YnN5c3RlbV9kZXZpY2UgIT0gMHgxMjkxKQorCQlyZXR1
cm47CisKKwlkZXZfaW5mbyhkZXYsICJIaWRpbmcgRGl2YSBidWlsdC1pbiBBVVggc2VyaWFs
IGRldmljZSIpOworCWRldi0+ZGV2aWNlID0gMDsKK30KK0RFQ0xBUkVfUENJX0ZJWFVQX0hF
QURFUihQQ0lfVkVORE9SX0lEX0hQLCBQQ0lfREVWSUNFX0lEX0hQX0RJVkFfQVVYLAorCXF1
aXJrX2RpdmFfYXV4X2Rpc2FibGUpOworCg==
--------------3C1AED33775088403FE66C0B--
