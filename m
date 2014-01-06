From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Ensure full cache coherency for kmap/kunmap
Date: Mon, 06 Jan 2014 10:21:47 +0100
Message-ID: <52CA75AB.8@gmx.de>
References: <BLU0-SMTP52D17D9034339F8843CB9D97B70@phx.gbl> <52CA4C6B.5040605@landcomp.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
To: Dave Land <xmechanic@landcomp.net>,
	John David Anglin <dave.anglin@bell.net>,
	linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <52CA4C6B.5040605@landcomp.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 01/06/2014 07:25 AM, Dave Land wrote:
> On 1/5/14 7:25 PM, John David Anglin wrote:
>> Helge Deller noted a few weeks ago problems with the AIO support
>> on parisc.  This change is the result of numerous iterations on how
>> best to deal with this problem.
>> 
>> The solution adopted here is to provide full cache coherency in a 
>> uniform manner on all parisc systems. This involves calling
>> flush_dcache_page() on kmap operations and 
>> flush_kernel_dcache_page() on kunmap operations.  As a result, the
>> copy_user_page() and clear_user_page() functions can be removed and
>> the overall code is simpler.
>> 
>> The change ensures that both userspace and kernel aliases to a
>> mapped page are invalidated and flushed. This is necessary for the
>> correct operation of PA8800 and PA8900 based systems which do not
>> support inequivalent aliases.
>> 
>> With this change, I have observed no cache related issues on c8000
>> and rp3440.  It is now possible for example to do kernel builds
>> with "-j64" on four way systems.
>> 
>> On systems using XFS file systems, the patch recently posted by
>> Mikulas Patocka to "fix crash using XFS on loopback" is needed to
>> avoid a hang caused by an uninitialized lock passed to
>> flush_dcache_page() in the page struct.
>> 
>> Signed-off-by: John David Anglin  <dave.anglin@bell.net> ---
>> 
>> 
> 
> Just an FYI for all... I still get the inequivalent aliases messages
> periodically on both my PA8700 machines, and the only tasks they're

Just for the record:

The inequivalent aliases messages are uncritical and they are not related to this
patch. Those messages just mean, that the userspace processes needs to
be rebuilt to correctly align their data areas. A rebuild of those will
fix this problem.

The patch above should fix kernel bugs like this one:

[154422.816000] IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004021fa9c 000000004021faa0
[154422.964000]  IIR: 03ffe01f    ISR: 0000000010340000  IOR: 000006ffdb36c7f0
[154422.964000]  CPU:        1   CR30: 00000001fff6c000 CR31: ffffffffffffffff
[154423.108000]  ORIG_R28: 00000001ef520c48
[154423.108000]  IAOQ[0]: iov_iter_advance+0x3c/0xd0
[154423.252000]  IAOQ[1]: iov_iter_advance+0x40/0xd0
[154423.252000]  RP(r2): generic_file_buffered_write+0x20c/0x3e8
[154423.400000] Backtrace:
[154423.400000]  [<000000004022198c>] generic_file_buffered_write+0x20c/0x3e8
[154423.544000]  [<00000000402242b4>] __generic_file_aio_write+0x24c/0x470
[154423.544000]  [<0000000040224570>] generic_file_aio_write+0x98/0x128
[154423.692000]  [<00000000107ab51c>] ext4_file_write+0xc4/0x558 [ext4]
[154423.836000]  [<000000004029ec78>] do_sync_write+0x90/0xe8
[154423.836000]  [<000000004029f6ac>] vfs_write+0xdc/0x298
[154423.984000]  [<00000000402a05c0>] SyS_write+0xa0/0x108
[154423.984000]  [<0000000040105fc0>] syscall_exit+0x0/0x14

> doing at the moment is buildd work, and a LAMP-based website on the
> 'hpviz' (J6750), though I haven't seen any of those messages pointing
> toward issues with PHP, Apache2, or MySQL... at least not yet.
> Hopefully this patch will help eliminate the problem on the PA8700
> series and others. ;-)

Helge
