From: "Joel Soete" <soete.joel@tiscali.be>
Subject: =?ISO-8859-1?Q?RE=3A=20=5Bparisc=2Dlinux=5D=20Update=20to=20palo=20to=20allow=20the=20listing=20of=20the=20current=09kernel=20directory?=
Date: Fri, 14 May 2004 13:44:33 +0000
Message-ID: <409BA51F00004EBD@ocpmta1.freegates.net>
References: <1084492855.3838.497.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-1"
To: "James Bottomley" <James.Bottomley@steeleye.com>,
 "PARISC list" <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1084492855.3838.497.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi all,

That works for me ;)
but if there are some mistake in the palo.conf (an empty one ?) and you
don't want to boot interactively: the ipl will loop .
I suggested a patch (http://lists.parisc-linux.org/pipermail/parisc-linux=
/2004-January/022030.html)
which I use with success since this time on my b2k, n4k and c110. Though
I never get any news, is there any interest to submit an update?

Thanks,
    Joel
> -- Original Message --
> From: James Bottomley <James.Bottomley@steeleye.com>
> To: PARISC list <parisc-linux@lists.parisc-linux.org>
> Date: 13 May 2004 19:00:54 -0500
> Subject: [parisc-linux] Update to palo to allow the listing of the curr=
ent
> 	kernel directory
> 
> 
> This patch (to palo's cvs head) adds the capability to list whatever's
> in the current kernel directory.  Probably you'll only find it useful
> if, like me, you keep lots of kernels around and can never remember
> their names
> 
> James
> 
> Index: ipl/bootloader.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> RCS file: /var/cvs/palo/ipl/bootloader.h,v
> retrieving revision 1.13
> diff -u -r1.13 bootloader.h
> --- a/ipl/bootloader.h	30 Dec 2003 17:52:06 -0000	1.13
> +++ b/ipl/bootloader.h	13 May 2004 23:58:38 -0000
> @@ -21,6 +21,7 @@
>  	int	(*open)(const char *filename);
>  	int	(*bread)(int fd, long blkno, long nblks, char *buf);
>  	void	(*close)(int fd);
> +	const char *	(*readdir)(int fd, int rewind);
>  };
>  
> 
> @@ -60,6 +61,8 @@
>  int ext2_mount(long cons_dev, long p_offset, long quiet);
>  int ext2_open(const char *filename);
>  int ext2_filesize(int fd);
> +const char * ext2_readdir(int fd, int rewind);
> +void ext2_close(int fd);
>  
>  /* lib.c */
>  void blockprint(int zero_offset, char *buf, int nbytes);
> Index: ipl/ext2.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> RCS file: /var/cvs/palo/ipl/ext2.c,v
> retrieving revision 1.11
> diff -u -r1.11 ext2.c
> --- a/ipl/ext2.c	28 Jul 2002 05:24:06 -0000	1.11
> +++ b/ipl/ext2.c	13 May 2004 23:58:39 -0000
> @@ -674,14 +674,13 @@
>  	return ext2_breadi(ip, blkno, nblks, buffer);
>  }
>  
> -#if 0
>  /*
>   * Note: don't mix any kind of file lookup or other I/O with this or
>   * you will lose horribly (as it reuses blkbuf)
>   */
> -static const char * ext2_readdir(int fd, int rewind)
> +const char * ext2_readdir(int fd, int rewind)
>  {
> -	struct ext2_inode * ip =3D &inode_table[fd].inode;
> +	struct ext2_inode * ip =3D fd2inode[fd];
>  	struct ext2_dir_entry_2 * ent;
>  	if (!S_ISDIR(ip->i_mode)) {
>  		printf("fd %d (inode %d) is not a directory (mode %x)\n",
> @@ -696,7 +695,6 @@
>  		return NULL;
>  	}
>  }
> -#endif
>  
>  int ext2_filesize(int fd)
>  {
> @@ -822,7 +820,7 @@
>  }
>  
> 
> -static void ext2_close(int fd)
> +void ext2_close(int fd)
>  {
>  	/* blah, hack, don't close the root inode ever */
>  	if (&inode_table[fd].inode !=3D root_inode)
> @@ -831,9 +829,13 @@
>  
> 
>  struct bootfs ext2fs =3D {
> -	0 /* FS_EXT2 */, 0,
> -	ext2_mount,
> -	ext2_open,  ext2_bread,  ext2_close /* ,
> -	ext2_readdir, ext2_fstat */
> +	.fs_type =3D	0,
> +	.blocksize =3D	0,
> +	.mount =3D	ext2_mount,
> +	.open =3D		ext2_open,
> +	.bread =3D 	ext2_bread,
> +	.close =3D 	ext2_close,
> +	.readdir =3D	ext2_readdir,
> +	/* .fstat =3D	ext2_fstat */
>  };
>  /* $Id: ext2.c,v 1.5 2000/09/21 16:47:48 bame Exp $ */
> Index: ipl/ipl.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> RCS file: /var/cvs/palo/ipl/ipl.c,v
> retrieving revision 1.37
> diff -u -r1.37 ipl.c
> --- a/ipl/ipl.c	4 May 2004 21:41:05 -0000	1.37
> +++ b/ipl/ipl.c	13 May 2004 23:58:40 -0000
> @@ -215,6 +215,42 @@
>      strcpy(out, tmpbuf);
>  }
>  
> +static struct diskpartition partition[MAXPARTS];
> +static int ext2 =3D 0;
> +static int bootdev;
> +
> +static void
> +partition_transform(int *kern_part, int *rd_part)
> +{
> +    int i, palo_part =3D -1;
> +
> +    /* if the F0 partition is the same as the requested kernel partiti=
on,
> +     * for now change it to zero to re-use the existing logic.  Should=

do
> +     * the reverse in the future probably.
> +     */
> +    for (i =3D 0; i < sizeof partition / sizeof partition[0]; i++)
> +    {
> +	if (partition[i].id =3D=3D PALO_PARTITION)
> +	{
> +	    palo_part =3D i + 1;
> +	    if (*kern_part =3D=3D palo_part)
> +		*kern_part =3D 0;
> +
> +	    if (rd_part && *rd_part =3D=3D palo_part)
> +		*rd_part =3D 0;
> +
> +	    break;
> +	}
> +    }
> +
> +    if (ext2 && *kern_part =3D=3D 0) {
> +	*kern_part =3D palo_part;
> +	if(rd_part && *rd_part =3D=3D 0)
> +	    *rd_part =3D palo_part;
> +    }
> +
> +}
> +
>  static void
>  interact(char *commandline, int *ok)
>  {
> @@ -246,7 +282,7 @@
>  	{
>  	    printf("%2d: %s\n", i, argv[i]);
>  	}
> -	puts("\nEdit which field?\n(or 'b' to boot with this command line, 'r=
'
> to restore)? ");
> +	puts("\nEdit which field?\n(or 'b' to boot with this command line, 'r=
'
> to restore, 'l' to list dir)? ");
>  	numbuf[0] =3D '0';
>  	numbuf[1] =3D '\0';
>  	enter_text(numbuf, sizeof numbuf - 1);
> @@ -264,6 +300,48 @@
>  	    continue;
>  	}
>  
> +	if (numbuf[0] =3D=3D 'l')
> +	{
> +	    char  *p, kern_dir[256];
> +	    const char *dir;
> +	    int fd, part, part_fd;
> +	    
> +
> +	    join(commandline, argc, argv, ok);
> +	    parse_pfname(argv[0], &#8706;, kern_dir);
> +	    p =3D strrchr(kern_dir, '/');
> +	    *(p+1) =3D '.';
> +	    *(p+2) =3D '\0';
> +
> +	    printf("Directory listing of %s\n\n", kern_dir);
> +
> +	    partition_transform(&#8706;, NULL);
> +
> +	    part--;		/* partition table starts from zero */
> +	    part_fd =3D offset_open(bootdev, 512 * partition[part].start,
> +				      512 * partition[part].length);
> +	    if(ext2_mount(part_fd, 0, 0) =3D=3D -1) {
> +		printf("Failed to mount partition %d\n", part);
> +		continue;
> +	    }
> +
> +	    if((fd =3D ext2_open(kern_dir)) =3D=3D -1) {
> +		printf("Failed to open directory %s\n", kern_dir);
> +		continue;
> +	    }
> +
> +	    while((dir =3D ext2_readdir(fd, 0)) !=3D NULL)
> +		if(dir[0] !=3D '.') /* skip hidden files and . and .. */
> +		    printf("  %s\n", dir);
> +	    
> +	    printf("\n");
> +	    ext2_close(fd);
> +	    /* There's no umount ... since the next mount reuses
> +	     * the current one's data structures ... */
> +
> +	    continue;
> +	}
> +
>  	editfield =3D parse_number(numbuf, &p);
>  
>  	if (editfield < argc)
> @@ -284,13 +362,11 @@
>      extern char _end, _edata;
>      int partitioned;
>      unsigned entry;
> -    struct diskpartition partition[MAXPARTS];
>      struct firstblock f;
>      extern char commandline[];
>      int blocked_bootdev;
> -    int bootdev;
>      int wide;
> -    int kern_part, rd_part, i, ext2 =3D 0, palo_part =3D -1;
> +    int kern_part, rd_part;
>      char kern_name[128], rd_name[128];
>      char kern_fullname[128];
>      int ok =3D 1;
> @@ -448,30 +524,7 @@
>      if (rd_part !=3D -1)
>  	printf("Selected ramdisk: %s from partition %d\n", rd_name, rd_part);=

>  
> -    /* if the F0 partition is the same as the requested kernel partiti=
on,
> -     * for now change it to zero to re-use the existing logic.  Should=

do
> -     * the reverse in the future probably.
> -     */
> -    for (i =3D 0; i < sizeof partition / sizeof partition[0]; i++)
> -    {
> -	if (partition[i].id =3D=3D PALO_PARTITION)
> -	{
> -	    palo_part =3D i + 1;
> -	    if (kern_part =3D=3D palo_part)
> -		kern_part =3D 0;
> -
> -	    if (rd_part =3D=3D palo_part)
> -		rd_part =3D 0;
> -
> -	    break;
> -	}
> -    }
> -
> -    if (ext2 && kern_part =3D=3D 0) {
> -	kern_part =3D palo_part;
> -	if(rd_part =3D=3D 0)
> -	    rd_part =3D palo_part;
> -    }
> +    partition_transform(&kern_part, &rd_part);
>  
>      if (kern_part > 0 && !partitioned)
>      {
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


-------------------------------------------------------------------------=
---------------
Tiscali ADSL, 27,50 =80/mois...pendant 6 mois. 
La meilleure offre du march=E9 !
http://reg.tiscali.be/default.asp?lg=3Dfr




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
