From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] kernel install.sh patch/enhancement?
Date: Sat, 04 Feb 2006 18:15:13 +0000
Message-ID: <43E4EF31.3080300@tiscali.be>
References: <ITJYTG$104D92B447D6B504FB5F1167C1BF3EF1@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: Joel Soete <jsoete@morethan.org>
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <ITJYTG$104D92B447D6B504FB5F1167C1BF3EF1@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello pa*,


Joel Soete wrote:
> Hello pa*,
> 
> Just some small hunck to (I hope) improve our kernel install.sh.
> 
snip
> 2/ append kernel version to filename (as many other arch too):
> --- arch/parisc/install.sh.Orig 2006-01-23 14:30:17.000000000 +0100
> +++ arch/parisc/install.sh      2006-01-23 15:30:30.000000000 +0100
snip
> @@ -44,13 +47,18 @@
>  
>  # Default install
>  
> -if [ -f $4/vmlinux ]; then
> -       mv $4/vmlinux $4/vmlinux.old
> +if [ -f $4/vmlinux-$1 ]; then
> +       mv $4/vmlinux-$1 $4/vmlinux.old
> +fi
> +
> +if [ -f $4/System.map-$1 ]; then
> +       mv $4/System.map-$1 $4/System.old
>  fi
>  
> -if [ -f $4/System.map ]; then
> -       mv $4/System.map $4/System.old
> +if [ -f $4/config-$1 ]; then
> +       mv $4/config-$1 $4/config.old
>  fi
>  
> -cat $2 > $4/vmlinux
> -cp $3 $4/System.map
> +cat $2 > $4/vmlinux-$1
> +cp $3 $4/System.map-$1
> +cp .config $4/config-$1
> 
> 3/ my paranoid check (because by /boot is a fs usualy mounted in ro, as I
> presume most of sysadm ;-?) 
> --- arch/parisc/install.sh.Orig 2006-01-23 15:32:42.000000000 +0100
> +++ arch/parisc/install.sh      2006-01-23 15:57:24.000000000 +0100
snip
> @@ -62,3 +82,13 @@
>  cat $2 > $4/vmlinux-$1
>  cp $3 $4/System.map-$1
>  cp .config $4/config-$1
> +
> +if [ -h $4/vmlinux ]; then
> +       mv $4/vmlinux $4/vmlinux.prev
> +       ln -sf $4/vmlinux-$1 $4/vmlinux
> +fi
> +
> +if [ -h $4/System.map ]; then
> +       mv $4/System.map $4/System.prev
> +       ln -sf $4/System.map-$1 $4/System.map
> +fi
> ====<>====
> 
There was obviously some small bugs in those to hunk which I change like:
--- arch/parisc/install.sh.Orig 2006-02-03 14:34:17.000000000 +0100
+++ arch/parisc/install.sh      2006-02-03 14:17:12.000000000 +0100
@@ -68,27 +68,29 @@
  # Default install

  if [ -f $4/vmlinux-$1 ]; then
-       mv $4/vmlinux-$1 $4/vmlinux.old
+       mv $4/vmlinux-$1 $4/vmlinux-$1.old
  fi

  if [ -f $4/System.map-$1 ]; then
-       mv $4/System.map-$1 $4/System.old
+       mv $4/System.map-$1 $4/System.map-$1.old
  fi

  if [ -f $4/config-$1 ]; then
-       mv $4/config-$1 $4/config.old
+       mv $4/config-$1 $4/config-1$.old
  fi

  cat $2 > $4/vmlinux-$1
  cp $3 $4/System.map-$1
  cp .config $4/config-$1

-if [ -h $4/vmlinux ]; then
-       mv $4/vmlinux $4/vmlinux.prev
-       ln -sf $4/vmlinux-$1 $4/vmlinux
+cd $4
+if [ -h vmlinux ]; then
+       mv vmlinux vmlinux.prev
+       ln -sf vmlinux-$1 vmlinux
  fi

-if [ -h $4/System.map ]; then
-       mv $4/System.map $4/System.prev
-       ln -sf $4/System.map-$1 $4/System.map
+if [ -h System.map ]; then
+       mv System.map System.map.prev
+       ln -sf System.map-$1 System.map
  fi
+cd -
====<>====

Tx,
     Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
