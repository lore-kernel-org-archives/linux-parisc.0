Return-Path: <soete.joel@tiscali.be>
Received: from spoolo1.tiscali.be (spoolo1.tiscali.be [62.235.13.172])
	by dsl2.external.hp.com (Postfix) with ESMTP id 116884897
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 17 Apr 2004 14:44:23 -0600 (MDT)
Message-ID: <40819724.6050107@tiscali.be>
Date: Sat, 17 Apr 2004 20:44:20 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Joel Soete <soete.joel@tiscali.be>
References: <408174D7.2060709@tiscali.be> <20040417185711.GI17842@tausq.org>
	<408194AA.60704@tiscali.be>
In-Reply-To: <408194AA.60704@tiscali.be>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: Randolph Chung <randolph@tausq.org>,
	Carlos O'Donell <carlos@baldric.uwo.ca>,
	Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] Re: parisc-linux.org unreachable?
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

hmm much more a routing pb:

  # traceroute www.parisc-linux.org
traceroute to www.parisc-linux.org (192.25.206.7), 64 hops max, 40 byte packets
  1  * * *
  2  10.10.10.41 (10.10.10.41)  47 ms  47 ms  40 ms
  3  ge-3-2.gsr-02.bru.net.tiscali.be (62.235.3.214)  40 ms  39 ms  53 ms
  4  ge-5-2-0-1.bru10.ip.tiscali.net (213.200.69.9)  40 ms  39 ms  40 ms
  5  so-1-0-0.sjc10.ip.tiscali.net (213.200.82.233)  190 ms  190 ms  185 ms
  6  qwest-ic.ip.tiscali.net (213.200.66.234)  193 ms  189 ms  186 ms
  7  * * *
  8  * * *
  9  * * *
10  * * *
11  * * *
12  * * *
13  * * *
14  * * *
15  * * *
16  * *
17  * * *

Joel

Joel Soete wrote:
> Ok so it must be dns pb near my ISP.
> 
> Thanks,
> Joel
> 
> 
> Randolph Chung wrote:
> 
>>> This eveing p-l.org is unreachable for me?
>>> Am I alone?
>>
>>
>>
>> works for me. -randolph
> 
> 
