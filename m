From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] pa_memcpy: 2 small question
Date: Sun, 09 Jan 2005 19:07:27 +0000
Message-ID: <41E180EF.8040808@tiscali.be>
References: <20050105055412.68E06495698@palinux.hppa>
	<20050107095143.GN18497@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050107095143.GN18497@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Randolph,

I just studying your pa_memcpy code (always to see if I can use it to improve stuff that you suggested me: l*).
And I wonder understand some values in copy_dstalign():
[...]
in the shift computing:
         /* Calculate how to shift a word read at the memory operation
            aligned srcp to make it aligned for copy.  */
         sh_1 = 8 * (src % sizeof(unsigned int));
         sh_2 = 8 * sizeof(unsigned int) - sh_1;

what means '8' (== 2 * word size; i.e. 2 * 32 bit because MERGE use shrpw and so 2 (a pair of word)? )

next in
          switch (len % 4)
         {

is '4' because as mentioned in copy_dstalign() description this 'Handles _4_ words per loop'

Thanks in advance,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
