From: Arnd Bergmann <arnd@arndb.de>
Subject: [parisc-linux] Re: [PATCH] Common compat_sys_sysinfo (v2)
Date: Mon, 8 Jan 2007 06:54:26 +0100
Message-ID: <200701080654.27100.arnd__43653.8266753361$1416624259$gmane$org@arndb.de>
References: <20070107144850.GB3207@athena.road.mcmartin.ca>
	<20070107154045.GD3207@athena.road.mcmartin.ca>
	<20070108104347.83a004aa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Cc: akpm@osdl.org,
 linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>,
 parisc-linux@lists.parisc-linux.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070108104347.83a004aa.sfr@canb.auug.org.au>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Monday 08 January 2007 00:43, Stephen Rothwell wrote:
> > +asmlinkage long sys_sysinfo(struct sysinfo __user *info)
> > +{
> > +=A0=A0=A0=A0=A0struct sysinfo val;
> > +
> > +=A0=A0=A0=A0=A0do_sysinfo(&val);
> >
> > - out:
> > =A0=A0=A0=A0=A0=A0if (copy_to_user(info, &val, sizeof(struct sysinfo)))
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return -EFAULT;
>=20
> People have complined before that this adds a whole stack frame to the
> "normal" syscall path. =A0Personally I don't care, but it has been
> mentioned.

It might be a concern for something like 'read' which is called frequently
and in strange ways, but for 'sysinfo' this really should not matter.

	Arnd <><
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
