From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [parisc-linux] Re: [PATCH] Common compat_sys_sysinfo (v2)
Date: Mon, 8 Jan 2007 10:43:47 +1100
Message-ID: <20070108104347.83a004aa.sfr__23643.2677288123$1416624258$gmane$org@canb.auug.org.au>
References: <20070107144850.GB3207@athena.road.mcmartin.ca>
	<20070107151319.GA23478@infradead.org>
	<20070107152213.GC3207@athena.road.mcmartin.ca>
	<20070107154045.GD3207@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1042724951=="
Cc: Christoph Hellwig <hch@infradead.org>,
 akpm@osdl.org,
 linux-kernel@vger.kernel.org,
 parisc-linux@lists.parisc-linux.org,
 linux-arch@vger.kernel.org
To: Kyle McMartin <kyle@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070107154045.GD3207@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--===============1042724951==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Mon__8_Jan_2007_10_43_47_+1100_m6PjlmpmWyD=I.wq"

--Signature=_Mon__8_Jan_2007_10_43_47_+1100_m6PjlmpmWyD=I.wq
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Hi Kyle,

Looks good.  Just one nit and one comment.

On Sun, 7 Jan 2007 10:40:45 -0500 Kyle McMartin <kyle@parisc-linux.org> wrote:
>
> diff --git a/kernel/compat.c b/kernel/compat.c
> index 6952dd0..cebb4c2 100644
> --- a/kernel/compat.c
> +++ b/kernel/compat.c
 .
 .
 .
> +	    __put_user (s.uptime, &info->uptime) ||
                      ^
We don't put spaces in here ...

> +asmlinkage long sys_sysinfo(struct sysinfo __user *info)
> +{
> +	struct sysinfo val;
> +
> +	do_sysinfo(&val);
>
> - out:
>  	if (copy_to_user(info, &val, sizeof(struct sysinfo)))
>  		return -EFAULT;

People have complined before that this adds a whole stack frame to the
"normal" syscall path.  Personally I don't care, but it has been
mentioned.

--
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__8_Jan_2007_10_43_47_+1100_m6PjlmpmWyD=I.wq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFFoYXCFdBgD/zoJvwRAvt5AJ4vBigJICMLJanO+YBo1S+xZzJFEQCfbXi8
TEwHcaCFk6+/ul3Z/RmGpE0=
=fF8z
-----END PGP SIGNATURE-----

--Signature=_Mon__8_Jan_2007_10_43_47_+1100_m6PjlmpmWyD=I.wq--

--===============1042724951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1042724951==--
