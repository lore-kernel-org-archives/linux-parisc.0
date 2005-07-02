From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] [RFC] Alternative implementation of glibc spinlocks
Date: Sat, 02 Jul 2005 23:23:57 +0800
Message-ID: <42C6B18D.7090909@tausq.org>
References: <20050702135938.GV19114@tausq.org>
	<200507020935.42389.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-2022-JP
To: "Michael S. Zick" <mszick@morethan.org>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200507020935.42389.mszick@morethan.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Please reply on list.

> 1) Your free-listing of locks does not appear to be thread safe;
>     I.E: Protected from concurrent changes.
> 
> But then, perhaps my mind is going and I just did not
> read the code closely enough.

They are protected by a spinlock.

> 2) How about an alternative implementation?
> Based on 4,096 byte pages;
> 
> Using the find_[first|last]_[zero|one] asm routines;
> 
> As I recall, they only go to 64 bits currently but only
> require 3 instructions per binary radix (add 6 instructions
> for 256 bits);
> 
> First 16 bytes of the page - your current header;
> Second 16 bytes of the page - bitmap of available locks;

Why do you need a bitmap?

> First bit of the bitmap represents the current header -
> use this to lock the page list (currently called free-list);
> 
> Second bit of the bitmap represents the bitmap -
> use this to lock the bitmap;

how do you use a bit to do locking?

> The remaining 254 bits/lock structures per page are usable.

randolph
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
