From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: call_init in libc6 2.3.6.ds1-11
Date: Sat, 17 Feb 2007 15:32:16 -0500 (EST)
Message-ID: <200702172032.l1HKWHpp024086__37324.9728502289$1416624293$gmane$org@hiauly1.hia.nrc.ca>
References: <no.id>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <no.id> from "John David Anglin" at Feb 17, 2007 02:56:59 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> /* The test for "addr & 2" below is to accomodate old binaries which
>    violated the ELF ABI by pointing DT_INIT and DT_FINI at a function
>    descriptor.  */
> #define DL_DT_INIT_ADDRESS(map, addr) \
>   ((Elf32_Addr)(addr) & 2 ? (addr) : DL_AUTO_FUNCTION_ADDRESS (map, addr))

This is the ia64 define:

#define DL_DT_INIT_ADDRESS(map, addr) DL_AUTO_FUNCTION_ADDRESS (map, addr)

Calls to init on ia64 always use a function descriptor.

While it's possible that DT_INIT and DT_FINI shouldn't point at function
descriptors, the above hack can't be right since DL_DT_INIT_ADDRESS is used
for calling init() from dl-init.c:

      init_t init = (init_t) DL_DT_INIT_ADDRESS
	(l, l->l_addr + l->l_info[DT_INIT]->d_un.d_ptr);

      /* Call the function.  */
      init (argc, argv, env);

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
