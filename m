From: Helge Deller <deller@gmx.de>
Subject: Re: systemd on hppa and number of free RT signals
Date: Wed, 08 Oct 2014 11:10:22 +0200
Message-ID: <5434FF7E.1070804@gmx.de>
References: <5434418F.1020407@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@bell.net>,
	Jeroen Roovers <jer@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5434418F.1020407@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/07/2014 09:39 PM, Helge Deller wrote:
> I've just had a successful boot on hppa with systemd :-)
> The bootlog is attached.
>...
> I will provide prebuilt debian packages with those patches for kernel and glibc tomorrow for download, so that people may test themselves...

I've uploaded the debian kernel and glibc packages to:
ftp://ftp.parisc-linux.org/SIGNAL_NEW/

A short README is here:
ftp://ftp.parisc-linux.org/SIGNAL_NEW/README.txt

It would be nice if people could test it...

Helge
