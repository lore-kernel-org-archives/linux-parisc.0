Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-6-cust141.leed.broadband.ntl.com [80.0.5.141])
	by dsl2.external.hp.com (Postfix) with ESMTP id DB7234845
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Jun 2002 07:02:12 -0600 (MDT)
Received: from patrick by tyke.pjc.net with local (Exim 3.35 #1 (Debian))
	id 17Jw95-0002BV-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Jun 2002 14:02:11 +0100
Date: Mon, 17 Jun 2002 14:02:11 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] mke2fs odd number:
Message-ID: <20020617130211.GJ1177@tykepenguin.com>
References: <20020617095042.GE1177@tykepenguin.com> <1024316831.3d0dd59f20e61@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
In-Reply-To: <1024316831.3d0dd59f20e61@webmail.tiscalinet.be>
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

On Mon, Jun 17, 2002 at 02:27:11PM +0200, joel.soete@freebel.net wrote:
> Quoting Patrick Caulfield <patrick@tykepenguin.com>:
> 
> > Does anyone else get with from mke2fs:
> > 
> > This filesystem will be automatically checked every 22 mounts or
> > 1.23076e-312 days, whichever comes first.  Use tune2fs -c or -i to
> > override.
> 
> Also notice this last Friday (but no time to report.
> 
> > 
> > I really hope it doesn't want to check the filesystem that often :)
> > 
> Dono, if tune2fs more relevant:
> Check interval:           15552000 (6 months)

That's right (and it's what I have). Looking at the source I can't quite figure
out why the display is wrong:

void print_check_message(ext2_filsys fs)
{
        printf(_("This filesystem will be automatically "
                 "checked every %d mounts or\n"
                 "%g days, whichever comes first.  "
                 "Use tune2fs -c or -i to override.\n"),
               fs->super->s_max_mnt_count,
               (double)fs->super->s_checkinterval / (3600 * 24));
}

I have verified that fs->super->s_checkinterval is still 15552000, but if I
write a program that prints out 15552000/(3600 * 24) then I get 180 as expected!

I'm not at all worried about it (though I have raised a Debian bug report) I
just wondered if it's just my machine.

-- 

patrick
