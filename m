From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Clean up fixup routines for get_user()/put_user()
Date: Sat, 25 Mar 2017 11:41:01 -0400
Message-ID: <853363DA-9B8E-49ED-BB3D-262537DF5106@bell.net>
References: <20170325105915.GA15188@p100.box>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Al Viro <viro@ZenIV.linux.org.uk>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170325105915.GA15188@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-03-25, at 6:59 AM, Helge Deller wrote:

> +		/*
> +		 * Fix up get_user() and put_user().
> +		 * ASM_EXCEPTIONTABLE_ENTRY_EFAULT() sets bit 1 to indicate

Small nit - the bit set is bit 31 in .word.  Maybe "sets the least-significant bit in the relative address
of the fixup routine".

Excellent simplification.

Dave
--
John David Anglin	dave.anglin@bell.net



