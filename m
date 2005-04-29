From: Max Grabert <parisc@gmail.com>
Subject: Re: [parisc-linux] IDE cdrom crash when trying to mount it on
	C3600/B2K
Date: Fri, 29 Apr 2005 19:48:35 +0100
Message-ID: <e6eae02905042911485333ddb0@mail.gmail.com>
References: <20050429201503.35d767d3.gmsoft@gentoo.org>
Reply-To: Max Grabert <parisc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: Guy Martin <gmsoft@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050429201503.35d767d3.gmsoft@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 4/29/05, Guy Martin <gmsoft@gentoo.org> wrote:
> Hello guys,
>=20
> I have experienced a really bad bug when trying to create a installation
> cd for gentoo. When I try to mount a ide cd I only have this :
>=20
> hope root # mount /dev/hda /mnt/cdrom/
> Kernel panic - not syncing: Kernel Fault

This is a known problem, search the p-l m-l.
It only happens with the ide-cd driver, so try to use
ide-scsi instead ... "works for me" (tm).

Greetings, Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
