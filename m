From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: HPMC in ppa_init()
Date: Thu, 25 May 2006 17:50:12 +0000
Message-ID: <4475EE54.3080401@tiscali.be>
References: <20060525121929.DWFD5348.web2@localhost.localdomain>
	<20060525150250.GA6616@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: kyjung@datatek.co.kr,
 parisc-linux <parisc-linux@lists.parisc-linux.org>,
 ?????? <jyson@datatek.co.kr>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060525150250.GA6616@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello,

Grant Grundler wrote:
[snip]
> CPU 0
> 
> WARNING:  Memory configuration is not optimized for performance. Refer
> 
>>          to the System Installation or Memory Installation manuals for 
>>          memory configuration guidelines.
>>WARNING:  Memory SIMMs are not installed in the proper sequence. Refer
>>          to the System Installation or Memory Installation manuals for
>>          memory configuration guidelines.
>>
That will not resolve your pb but as I recently encounter such warning and know now that it's usefull, I would also take care of 
those messages. (may be simply check if all memory chips are pluged in correctly and 'in proper sequence')

Hth 2,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
