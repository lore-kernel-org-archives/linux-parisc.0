From: Kyle McMartin <kmcmarti@redhat.com>
Subject: Re: [PATCH] arch: parisc: kernel: using strlcpy() instead of strcpy()
Date: Thu, 30 May 2013 11:35:51 -0400
Message-ID: <20130530153551.GN19205@redacted.bos.redhat.com>
References: <51A6A8F3.2030200@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, udknight@gmail.com,
	Greg KH <gregkh@linuxfoundation.org>,
	Parisc List <linux-parisc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Linux-Arch <linux-arch@vger.kernel.org>
To: Chen Gang <gang.chen@asianux.com>
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <51A6A8F3.2030200@asianux.com>
List-ID: <linux-arch.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, May 30, 2013 at 09:18:43AM +0800, Chen Gang wrote:
> 
> 'boot_args' is an input args, and 'boot_command_line' has a fix length.
> 
> So need use strlcpy() instead of strcpy() to avoid memory overflow.
> 

This is basically impossible, since boot_args is fixed in size by palo,
initialized to zero, and length checked in the bootloader. It's also
only 256+4 bytes compared to the 1024 bytes set aside for
boot_command_line.

That said, it's harmless to use strlcpy here, and obviously (more)
correct. Thanks!

Acked-by: Kyle McMartin <kyle@mcmartin.ca>
