Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.latnet.lv (mail.latnet.lv [159.148.108.208])
	by dsl2.external.hp.com (Postfix) with SMTP id 0B3044829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Jun 2003 13:59:46 -0600 (MDT)
Message-ID: <3F0095AA.4050909@latnet.lv>
Date: Mon, 30 Jun 2003 22:55:22 +0300
From: Dub <dub@latnet.lv>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] modprobe: Can't locate module char-major-60 (server
 hangs!)
References: <1056995678.3f00795e49bf5@clients.latnet.lv> <20030630175811.GK31618@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii; format=flowed
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


Matthew Wilcox wrote:

>On Mon, Jun 30, 2003 at 08:54:38PM +0300, Dub wrote:
>  
>
>>Jun 27 15:08:47 smsmail4 modprobe: modprobe: Can't locate module char-major-60
>>    
>>
>
>ttyB0 has the wrong major number.  It needs to be character major 11.
>
>  
>
Thank you, great! If so, how to fix it in most efficient way?

BR,
Dub
