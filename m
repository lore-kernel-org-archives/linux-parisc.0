Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 65331484B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Jun 2002 07:04:27 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17JwBG-0007Be-00
	for parisc-linux@lists.parisc-linux.org; Mon, 17 Jun 2002 14:04:26 +0100
Date: Mon, 17 Jun 2002 14:04:26 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] mke2fs odd number:
Message-ID: <20020617140426.U9435@parcelfarce.linux.theplanet.co.uk>
References: <20020617095042.GE1177@tykepenguin.com> <1024316831.3d0dd59f20e61@webmail.tiscalinet.be> <20020617130211.GJ1177@tykepenguin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020617130211.GJ1177@tykepenguin.com>; from patrick@tykepenguin.com on Mon, Jun 17, 2002 at 02:02:11PM +0100
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

On Mon, Jun 17, 2002 at 02:02:11PM +0100, Patrick Caulfield wrote:
> void print_check_message(ext2_filsys fs)
> {
>         printf(_("This filesystem will be automatically "
>                  "checked every %d mounts or\n"
>                  "%g days, whichever comes first.  "
>                  "Use tune2fs -c or -i to override.\n"),
>                fs->super->s_max_mnt_count,
>                (double)fs->super->s_checkinterval / (3600 * 24));
> }

hehe.. passing a double to a varargs ... known bug ;-(  I think it's
fixed with gcc-3.1.

-- 
Revolutions do not require corporate support.
