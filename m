From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Debian vmlinux-4.14.0-1-parisc64-smp fails to boot on c3750
Date: Sun, 3 Dec 2017 15:53:53 -0500
Message-ID: <BE077D1B-C113-4BBF-8F61-1850AEAAED78@bell.net>
References: <008A2452-42ED-45E9-8FDE-69757C9D6962@bell.net> <5b767291-0b39-b38b-26f6-80bb6f462032@gmx.de> <7df24e2b-24b4-c62d-eff6-33813c883280@gmx.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7df24e2b-24b4-c62d-eff6-33813c883280@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-12-03, at 3:36 PM, Helge Deller wrote:

> Are you sure that you have run "palo" once that version 1.99 of the palo IPL is installed in your
> boot sector?  Just having palo 1.99 installed in the Linux filesystems is not sufficient.

That was it.  The palo.conf file had a couple of problems and palo didn't run fully.  The boot
drive had changed from /dev/sda to /dev/sdb...

Thanks,
Dave
--
John David Anglin	dave.anglin@bell.net



