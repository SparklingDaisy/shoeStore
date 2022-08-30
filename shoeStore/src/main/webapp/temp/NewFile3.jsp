<table class="table">
						<tr>
						<td align="center"><h2>나의 정보변경</h2></td>
						</tr>
					  </table>
					  <form name="memberInfo" action="memberInfo_ok.jsp">
						  <table class="table">
							<tr>
								<td class="table">ID</td>
								<td class="td"><input type="text" name="mid" value="<%=dto.getMid() %>" readonly>
							</tr>
							<tr>
								<td class="table">Password</td>
								<td><input type="password" name="mpwd"></td>
							</tr>
							<tr>
								<td class="table">Password Confirm</td>
								<td><input type="password" name="mpwd2"></td>
							</tr>
							<tr>
								<td class="table">name</td>
								<td><input type="text" name="mname" value="<%=dto.getMname()%>" readonly><br>
							</tr>
							<tr>
								<td class="table">birthdate</td>
								<td><input type="text" name="mbirthdate" value="<%=dto.getMbirthdate()%>"><br>
							</tr>
							<tr>
								<td class="table">Phonenumber</td>
								<td><input type="text" name="mtel" value="<%=dto.getMtel()%>"></td>
							</tr>
							<tr>
								<td class="table">Address</td>
								<td><input type="text" name="maddr" value="<%=dto.getMaddr()%>"></td>
							</tr>
							<tr>
								<td class="table">E-mail Address</td>
								<td><input type="text" name="memail" value="<%=dto.getMemail()%>"></td>
							</tr>
						  </table>
					  <div>
						  <input type="submit" value="OK">
						  <a href="/shoeStore.jsp"><input type="button" value="Cancel"></a>
					  </div>
				  </form>