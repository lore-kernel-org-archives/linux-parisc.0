Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 47EA94834
	for <parisc-linux@lists.parisc-linux.org>; Thu, 24 Oct 2002 23:58:14 -0600 (MDT)
Date: Fri, 25 Oct 2002 07:57:38 +0200
Message-ID: <3DB5755500000A19@ocpmta7.be.tiscali.com>
In-Reply-To: <20021024175802.GA9490@dreamind.de>
From: jsoe0708@tiscali.be
Subject: RE: [parisc-linux] Re: mkfs.xfs (xfsprogs-2.3.5) failled
To: "Stefan Pfetzing" <dreamind@dreamind.de>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Stephan,

>* jsoe0708@tiscali.be <jsoe0708@tiscali.be> [021023 09:30]:
>> Hi Stephan,
>> 
>> As you do earlier, I build a xfs-kernel diff versus 2.4.19 vanilla kernel,
>> apply it against 2.4.19-pa22 (with very small problem) and obtain a bootable
>> (and operational) kernel.
>Yup.
>
>> Now I rebuild debian package of xfsprogs-2.3.5 (cvs form) and obtain tools
>> binaries (without warning or error) but even mkfs -t xfs (mkfs.xfs) failed
>> with this concise message: "mkfs.xfs: cannot reserve space [28 - No space
>> left on device]".
>> (I try to xfs_check which failed also with a lot of error messages).
>Yea thats a problem, still in the Linux/Parisc kernel. It gives garbage
with
>BLKGETSIZE64. Simply look in the xfslibs directory where BLGKETSIZE64 is
>used
>and comment that out. Thats a disgusting hack but it leads to a set of working
>xfsprogs.
>
>If you want I can make a patch for you, but this will take some time, since
>I
>have the source not right by hand now.
Hmm I would have to be aware (as I try to implement put_user and get_user
for 64bits [ie long long] [unfortunately] without great success till now).

Evms also use BLKGETSIZE64 in a way that would be safely. The problem is
that hppa kernel just printk a bug message and do not return a error message
as ENOSYS or ENOTSUP? (duno yet how other platform manage this case)

Thanks for advise (will inform of progress)
    Joel
