Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 22512484F
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Jun 2002 14:44:04 -0600 (MDT)
Subject: Re: [parisc-linux] Unaligned access failures with apt-get on SMP
From: Ryan Bradetich <rbradetich@uswest.net>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, richard_hirst@linuxcare.com
In-Reply-To: <200206170412.g5H4CGP8011158@hiauly1.hia.nrc.ca>
References: <200206170412.g5H4CGP8011158@hiauly1.hia.nrc.ca>
Content-Type: text/plain
Date: 17 Jun 2002 14:43:49 -0600
Message-Id: <1024346629.27050.52.camel@beavis>
Mime-Version: 1.0
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

John et all,

I recompiled the debian apt-get package this time leaving the debug
symbols intact.  


Here is the function that is causing the failure:

// DynamicMMap::Allocate - Pooled aligned allocation                   
/*{{{*/
// ---------------------------------------------------------------------
/* This allocates an Item of size ItemSize so that it is aligned to its
   size in the file. */
unsigned long DynamicMMap::Allocate(unsigned long ItemSize)
{
   // Look for a matching pool entry
   Pool *I;
   Pool *Empty = 0;
   for (I = Pools; I != Pools + PoolCount; I++)
   {
      if (I->ItemSize == 0)
         Empty = I;
      if (I->ItemSize == ItemSize)
         break;
   }

   // No pool is allocated, use an unallocated one
   if (I == Pools + PoolCount)
   {
      // Woops, we ran out, the calling code should allocate more.
      if (Empty == 0)
      {
         _error->Error("Ran out of allocation pools");
         return 0;
      }

      I = Empty;
      I->ItemSize = ItemSize;
      I->Count = 0;
   }

   // Out of space, allocate some more
   if (I->Count == 0)
   {
      I->Count = 20*1024/ItemSize;
      I->Start = RawAllocate(I->Count*ItemSize,ItemSize);
   }

   I->Count--;
   unsigned long Result = I->Start;
   I->Start += ItemSize;
   return Result/ItemSize;
}


Here is my gdb output while tracing the failure:

root@rebel:~# gdb /usr/bin/apt-get 
GNU gdb 2002-04-01-cvs
Copyright 2002 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you
are
welcome to change it and/or distribute copies of it under certain
conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for
details.
This GDB was configured as "hppa-linux"...

(gdb) b main
Breakpoint 1 at 0x27ea4: file apt-get.cc, line 2134.

(gdb) run install less
Starting program: /usr/bin/apt-get install less

Breakpoint 1, main (argc=3, argv=0x46e66) at apt-get.cc:2134
2134	   CommandLine CmdL(Args,_config);

(gdb) b DynamicMMap::Allocate
Breakpoint 2 at 0x40050358: file contrib/mmap.cc, line 229.

(gdb) continue
Continuing.
Reading Package Lists... 0%
Breakpoint 2, DynamicMMap::Allocate(unsigned long) (this=0x4c900,
ItemSize=275112) at contrib/mmap.cc:229
229	   Pool *Empty = 0;

(gdb) bt
#0  DynamicMMap::Allocate(unsigned long) (this=0x4c900, ItemSize=275112)
at contrib/mmap.cc:229
#1  0x400ba64c in pkgCacheGenerator::SelectFile(std::string,
std::string, pkgIndexFile const&, unsigned long) (this=0xbff01020, File=
        {static npos = 4294967295, _M_dataplus = {<allocator<char>> =
{<No data fields>}, _M_p = 0x489f4 "/var/lib/dpkg/status"}, static
_S_empty_rep_storage = {0, 0, 1, 18, 1, 0}}, Site={static npos =
4294967295, _M_dataplus = {<allocator<char>> = {<No data fields>}, _M_p
= 0x432b4 ""}, static _S_empty_rep_storage = {0, 0, 1, 18, 1, 0}},
Index=@0x4bda0, 
    Flags=1) at pkgcachegen.cc:404
#2  0x400e5a14 in debStatusIndex::Merge(pkgCacheGenerator&, OpProgress&)
const (this=0x4bda0, Gen=@0xbff01020, Prog=@0xbff00d90) at
/usr/include/g++-v3/bits/basic_string.h:863
#3  0x400bbf8c in BuildCache(pkgCacheGenerator&, OpProgress&, unsigned
long&, unsigned long, std::__normal_iterator<pkgIndexFile**,
std::vector<pkgIndexFile*, std::allocator<pkgIndexFile*> > >,
std::__normal_iterator<pkgIndexFile**, std::vector<pkgIndexFile*,
std::allocator<pkgIndexFile*> > >) (Gen=@0xbff01020,
Progress=@0xbff00d90, CurrentSize=@0xbff01190, 
    TotalSize=107592,
Start={<iterator<std::random_access_iterator_tag,pkgIndexFile*,int,pkgIndexFile**,pkgIndexFile*&>> = {<No data fields>}, _M_current = 0x4c578}, End=
     
{<iterator<std::random_access_iterator_tag,pkgIndexFile*,int,pkgIndexFile**,pkgIndexFile*&>> = {<No data fields>}, _M_current = 0x4c57c})
    at /usr/include/g++-v3/bits/stl_iterator.h:478
#4  0x400bd280 in pkgMakeStatusCache(pkgSourceList&, OpProgress&,
MMap**, bool) (List=@0xbff01020, Progress=@0xbff00d90,
OutMap=0xbff00990, AllowMem=224)
    at /usr/include/g++-v3/bits/stl_vector.h:187
#5  0x400ad8d4 in pkgCacheFile::Open(OpProgress&, bool)
(this=0xbff00990, Progress=@0xbff00d90, WithLock=true) at
cachefile.cc:70
#6  0x0002b794 in CacheFile::Open(bool) (this=0xbff00990, WithLock=56)
at apt-get.cc:85

(gdb) n
DynamicMMap::Allocate(unsigned long) (this=0x4c900, ItemSize=275112) at
contrib/mmap.cc:226
226	{   

(gdb) n
DynamicMMap::Allocate(unsigned long) (this=0x4c900, ItemSize=56) at
contrib/mmap.cc:230
230	   for (I = Pools; I != Pools + PoolCount; I++)

(gdb) n
232	      if (I->ItemSize == 0)

(gdb) n
234	      if (I->ItemSize == ItemSize)

(gdb) n
230	   for (I = Pools; I != Pools + PoolCount; I++)

(gdb) n
234	      if (I->ItemSize == ItemSize)

(gdb) n
230	   for (I = Pools; I != Pools + PoolCount; I++)

(gdb) n
234	      if (I->ItemSize == ItemSize)

(gdb) n
230	   for (I = Pools; I != Pools + PoolCount; I++)

(gdb) n
234	      if (I->ItemSize == ItemSize)

(gdb) n
230	   for (I = Pools; I != Pools + PoolCount; I++)

(gdb) n
234	      if (I->ItemSize == ItemSize)

(gdb) n
230	   for (I = Pools; I != Pools + PoolCount; I++)

(gdb) n
234	      if (I->ItemSize == ItemSize)

(gdb) n
230	   for (I = Pools; I != Pools + PoolCount; I++)

(gdb) n
234	      if (I->ItemSize == ItemSize)

(gdb) n
239	   if (I == Pools + PoolCount)

(gdb) n
254	   if (I->Count == 0)


========> Things get interesting here <=======

(gdb) n
261	   unsigned long Result = I->Start;

(gdb) n
263	   return Result/ItemSize;

(gdb) n
260	   I->Count--;

(gdb) n
263	   return Result/ItemSize;

(gdb) n

260	   I->Count--;
(gdb) n

Program received signal SIGBUS, Bus error.
DynamicMMap::Allocate(unsigned long) (this=0x4c900, ItemSize=56) at
contrib/mmap.cc:263
263	   return Result/ItemSize;


It looks like the the function gets exited twice.... but I do not see
any recursion in the function, and the function is not listed twice
in the origional back trace I posted.  Do we have a corrupt stack?
or can you think of anything else?  I would be glad to provide any
additional debugging output to anyone interested.  I can also give
remote access to this system if someone is interested in looking
this further.

Thanks,

- Ryan



On Sun, 2002-06-16 at 22:12, John David Anglin wrote:
> > any way I can tell from the binary?
> 
> Not that I am aware of.  On further thought, I think the user code is ok.
> 
> Studying you original message further, I see that the printout from
> unaligned.c is fully consistent with the register dump and user code.
> Thus, I have to think that the problem is actually in the kernel.
> 
> If the failure occurs all the time, I would put a break at 0x4005e47c
> and then set a large ignore count.  Run the program and see how many
> times the break is hit before the fault occurs.  Then, set the ignore
> count to 1 less than the number of hits and rerun.  If the fault is
> deterministic, you should be able to determine the exact conditions
> which cause the "trap".
> 
> Oh, I remember that gdb may not print r3 correctly with info reg.
> It's better to use p $r3 or printf "0x%x\n", $r3.
> 
> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
> 
