From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] confirme: bug in arg checking in clone.S
Date: Fri, 17 Mar 2006 10:08:54 +0100
Message-ID: <IW9LEU$94CB4BA291005A077804FC6FE19E35E4@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Hello Mike and list,
> 
> Mike Frysinger wrote:
> > for some reason the attached test case (originally from LTP) segfault=
s on 
> > glibc/hppa systems ... every other arch ive tested on works fine ...
> > 
> Ok I find this LTP Stuff.
> # ./clone04
> clone04     1  BROK  :  Unexpected signal 11 received.
> 
> 
> Effectively, as the comment said:
>   * DESCRIPTION
>   *      Verify that,
>   *      clone(2) returns -1 and sets errno to EINVAL if
>   *      child stack is set to a zero value(NULL)
> 
> Also as your subject better explain, the hppa implementation didn't do =
a
"Sanity check arguments" (as other arch does).
> 
> Can somebody could check this patch proposal:
> --- ./sysdeps/unix/sysv/linux/hppa/clone.S.Orig 2006-01-14
17:48:33.000000000 +0000
> +++ ./sysdeps/unix/sysv/linux/hppa/clone.S      2006-03-04
19:46:03.000000000 +0000
> @@ -46,6 +46,11 @@
>           .text
>   ENTRY(__clone)
> 
> +       /* Sanity check arguments.  */
> +       ldi     -EINVAL, %ret0
> +       comib,=3D,n       0,%r26,.Lerror  /* no NULL function pointers =
*/
> +       comib,=3D,n       0,%r25,.Lerror  /* no NULL stack pointers */
> +
>          /* Save the fn ptr and arg on the new stack.  */
>          stwm    %r26,64(%r25)
>          stw     %r23,-60(%r25)
> =3D=3D=3D=3D<>=3D=3D=3D=3D
> 
> (Not sure I didn't miss some nop in delay slot on comib?)
> 
Definitely we had to restore hunk:
RCS file: /var/lib/cvs/glibc/sysdeps/unix/sysv/linux/hppa/clone.S,v
retrieving revision 1.2
retrieving revision 1.3
diff -u -r1.2 -r1.3
--- glibc/sysdeps/unix/sysv/linux/hppa/clone.S	2005/06/08 20:32:42	1.2
+++ glibc/sysdeps/unix/sysv/linux/hppa/clone.S	2005/08/02 17:02:02	1.3
[...]
-	/* FIXME: I have no idea how profiling works on hppa. */
-
-	/* Sanity check arguments.  */
-	comib,=3D  0,%arg0,.Lerror        /* no NULL function pointers */
-	ldi     -EINVAL,%ret0
-	comib,=3D  0,%arg1,.Lerror        /* no NULL stack pointers */
-	nop
[...]

but we also have to goto one step after:
'/* Restore the PIC register on error */'

that way I bit progress:
# ./clone04
clone04     1  PASS  :  expected failure; Got EINVAL

Cool isn't it?

Unfortunately, I still have a draw back: the system panics immediately on=

kernel bug:
clone04(1905): unaligned access to 0xfffffffa at ip=3D0x00011027         =
      
                                      
clone04(1905): unaligned access to 0xfffffffa at ip=3D0x0001105f         =
      
                                                      
clone04(1905): unaligned access to 0xfffffffa at ip=3D0x00011177         =
      
                                                      
clone04(1905): unaligned access to 0xfffffffa at ip=3D0x0001117f         =
      
                                                      
Unaligned handler failed, ret =3D -2                                     =
      
                                                      
clone04 (pid 1905): Unaligned data reference (code 28) at 0001119b       =
    
                                                      
kernel BUG at /CAD/linux-2.6.16-rc6-paem2/mm/mmap.c:1957!                =
    
                                                      
Backtrace:                                                               =
    
                                                      
 [<10158944>] exit_mmap+0x178/0x198                                      =
    
                                                      
 [<101235a4>] mmput+0x44/0xb8                                            =
    
                                                      
 [<10128308>] do_exit+0x12c/0x8a0                                        =
    
                                                      
 [<10128ae0>] do_group_exit+0x64/0xc4                                    =
    
                                                      
 [<1010b114>] syscall_exit+0x0/0x14                                      =
    
                                                      
                                                                         =
    
                                                      
Kernel panic - not syncing: BUG!

Hth,
    Joel
=0A=0A---------------------------------------------------------------=0AA=
 free anti-spam and anti-virus filter on all Scarlet mailboxes=0AMore inf=
o on http://www.scarlet.be/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
