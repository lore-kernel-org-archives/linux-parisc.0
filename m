From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] User space locks -- what's wrong
Date: Sun, 11 Jun 2006 19:57:40 -0400 (EDT)
Message-ID: <200606112357.k5BNvgoL020309@hiauly1.hia.nrc.ca>
References: <119aab440606111620w40d1808en7adec56144d4b1aa@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440606111620w40d1808en7adec56144d4b1aa@mail.gmail.com>
	from "Carlos O'Donell" at Jun 11, 2006 07:20:47 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On 6/11/06, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> > > You've implemented almost exactly what glibc does for pthreads.
> > > However, glibc uses nanosleep without any adverse effects.
> >
> > Are you sure?  The libgomp test libgomp.fortran/reduction6.f90
> > times out.  It's using pthread_mutex_lock and pthread_mutex_unlock
> > for locking (there's no futex implementation for parisc-linux).
> 
> Can we get a reduced testcase from this?

> We *could* experiment with turning on HAS_COMPARE_AND_SWAP in
> linuxthreads, and using the LWS CAS to implement this.
> 
> I'm dying for a testcase...

The testcase is already quite reduced:

! { dg-do run }

  integer, dimension (6, 6) :: a
  character (36) :: c
  integer nthreads
  a = 9
  nthreads = -1
  call foo (a (2:4, 3:5), nthreads)
  if (nthreads .eq. 3) then
    write (c, '(36i1)') a
    if (c .ne. '999999999999966699966699966699999999') call abort
  end if
contains
  subroutine foo (b, nthreads)
    use omp_lib
    integer, dimension (3:, 5:) :: b
    integer :: err, nthreads
    b = 0
    err = 0
!$omp parallel num_threads (3) reduction (+:b)
    if (any (b .ne. 0)) then
!$omp atomic
      err = err + 1
    end if
!$omp master
    nthreads = omp_get_num_threads ()
!$omp end master
    b = 2
!$omp end parallel
    if (err .gt. 0) call abort
  end subroutine foo
end

I've forgotten all the fortran I ever knew.  In any case, I suspect
a lock initialization problem.  In the first call into __pthread_acquire
with this particular lock, it's not initialized:

(gdb) p *spinlock
$10 = {lock = {0, 0, 0, 0}} <== we would see some ones if initialized
(gdb) bt
#0  __pthread_acquire (spinlock=0x191030) at spinlock.c:710
#1  0x000319d4 in __pthread_alt_unlock (lock=0x191030) at spinlock.c:527
#2  0x0002ef18 in __pthread_mutex_unlock (mutex=<value optimized out>)
    at mutex.c:199
#3  0x00015388 in *_gfortran_st_write_done (dtp=0xbff00aa8)
    at ../../../gcc/libgfortran/io/transfer.c:2424
#4  0x000105ac in MAIN__ ()
    at /home/dave/gcc-4.2/gcc/libgomp/testsuite/libgomp.fortran/reduction6.f90:10
#5  0x00011e58 in main (argc=<value optimized out>, argv=<value optimized out>)
    at ../../../gcc/libgfortran/fmain.c:18
(gdb) p/x *($sp - 0x78)
$11 = 0x191030

So, I believe the value for spinlock in the backtrace.  Thus, this is
probably a libgfortran issue.  

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
