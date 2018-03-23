From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
Date: Fri, 23 Mar 2018 05:48:06 -0700
Message-ID: <20180323124806.GA5624@bombadil.infradead.org>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: kstewart@linuxfoundation.org, linux-mips@linux-mips.org, dalias@libc.org,
 jack@suse.cz, linux-sh@vger.kernel.org, benh@kernel.crashing.org,
 bhsharma@redhat.com, heiko.carstens@de.ibm.com, jejb@parisc-linux.org,
 linux-mm@kvack.org, mhocko@suse.com, paulus@samba.org, deepa.kernel@gmail.com,
 hpa@zytor.com, sparclinux@vger.kernel.org, linux-ia64@vger.kernel.org,
 dan.j.williams@intel.com, aarcange@redhat.com, linux-s390@vger.kernel.org,
 ysato@users.sourceforge.jp, mpe@ellerman.id.au, deller@gmx.de, x86@kernel.org,
 hughd@google.com, linux@armlinux.org.uk, nitin.m.gupta@oracle.com,
 linux-alpha@vger.kernel.org, mingo@redhat.com, jhogan@kernel.org,
 mattst88@gmail.com, linux-snps-arc@lists.infradead.org, fenghua.yu@intel.com,
 riel@redhat.com, punit.agrawal@arm.com, keescook@chromium.org, arnd@arndb.de,
 pombredanne@nexb.com, npiggin@gmail.com, jglisse@redhat.com,
 ink@jurassic.park.m
To: Ilya Smith <blackzert@gmail.com>
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org

On Thu, Mar 22, 2018 at 07:36:36PM +0300, Ilya Smith wrote:
> Current implementation doesn't randomize address returned by mmap.
> All the entropy ends with choosing mmap_base_addr at the process
> creation. After that mmap build very predictable layout of address
> space. It allows to bypass ASLR in many cases. This patch make
> randomization of address on any mmap call.

Why should this be done in the kernel rather than libc?  libc is perfectly
capable of specifying random numbers in the first argument of mmap.
