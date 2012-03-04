From: John David Anglin <dave.anglin@bell.net>
Subject: Re: HPPA64: Cannot write to ext4 filesystems with files > 28672 byte
Date: Sun, 4 Mar 2012 17:14:14 -0500
Message-ID: <BLU0-SMTP92018283116845C259EC9F97530@phx.gbl>
References: <51659a45a16b0a5b0ede44e3f3e830dc.squirrel@webmail.sf-mail.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51659a45a16b0a5b0ede44e3f3e830dc.squirrel@webmail.sf-mail.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 27-Feb-12, at 9:55 AM, Rolf Eike Beer wrote:

> Recent kernels (>3.x) fail when writing to ext4 filesystems with the
> message "file too large". The critical size is 28672 byte (7*2^12).  
> This
> has been traced down to ext4_max_size() by Tobias Ulmer, which looks  
> like
> this:


Fixed in GCC source trees (> 4.4).  Problem was incorrect shift caused
by truncation to int.

The following instruction was incorrect:

  50:   d7 9f 12 1d     depdi,z,* -1,sar,3,ret0

The length operand was incorrectly calculated.

Dave
--
John David Anglin	dave.anglin@bell.net



