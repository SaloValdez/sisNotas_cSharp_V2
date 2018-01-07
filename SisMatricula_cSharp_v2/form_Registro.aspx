<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="form_Registro.aspx.cs" Inherits="SisMatricula_cSharp_v2.form_Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="span6">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class=" icon-pencil"></i> </span>
            <h5>MANTENIMINETO - REGISTRO</h5>
          </div>
          <div class="widget-content nopadding">

              <table style="width: 100%;" id="contenedor_cajas">
                 
                  <tr>
                      <td id="texto_label"><asp:Label ID="Label1" runat="server" Text="Id : "></asp:Label></td>
                      <td> <asp:TextBox ID="txtId" runat="server" onkeyup="javascript:this.value=this.value.toUpperCase();" disabled ></asp:TextBox></td>
                  </tr>

                      <tr>
                      <td id="texto_label"><asp:Label ID="Label5" runat="server" Text="Alumno : "></asp:Label></td>
                      <td>
                          <asp:DropDownList ID="droAlumno" runat="server"></asp:DropDownList> </td>
                  </tr>

                   <tr>
                      <td id="texto_label"><asp:Label ID="Label6" runat="server" Text="Curso : "></asp:Label></td>
                      <td>
                          <asp:DropDownList ID="droCurso" runat="server"></asp:DropDownList> </td>
                  </tr>
                  <tr>
                      <td id="texto_label"><asp:Label ID="Label7" runat="server" Text="Docente : "></asp:Label></td>
                      <td>
                          <asp:DropDownList ID="droDocente" runat="server"></asp:DropDownList> </td>
                  </tr>



                  <tr>
                      <td id="texto_label"><asp:Label ID="Label2" runat="server" Text="Nota 1 : "></asp:Label></td>
                      <td> <asp:TextBox ID="txtNota1" runat="server" onkeyup="javascript:this.value=this.value.toUpperCase();"  ></asp:TextBox></td>
                  </tr>
                  <tr>
                      <td id="texto_label"><asp:Label ID="Label3" runat="server" Text="Nota 2 : "></asp:Label></td>
                      <td> <asp:TextBox ID="txtNota2" runat="server" onkeyup="javascript:this.value=this.value.toUpperCase();"  ></asp:TextBox></td>
                  </tr>
                  <tr>
                      <td id="texto_label"><asp:Label ID="Label4" runat="server" Text="Nota 3 : "></asp:Label></td>
                      <td> <asp:TextBox ID="txtNota3" runat="server" onkeyup="javascript:this.value=this.value.toUpperCase();"  ></asp:TextBox></td>
                  </tr>

                   <tr>
                      <td id="texto_label"><asp:Label ID="Label8" runat="server" Text="Promedio : "></asp:Label></td>
                      <td> <asp:TextBox ID="txtPromedio" runat="server" onkeyup="javascript:this.value=this.value.toUpperCase();" disabled  ></asp:TextBox><asp:Button ID="btnCarcular"  Style="margin-top:-10px; margin-left:3px;" class="" runat="server" Text="Calcular" OnClick="btnCarcular_Click"  /></td>
                  </tr>

                   <tr>
                      <td id="texto_label"><asp:Label ID="Label9" runat="server" Text="Observacion : "></asp:Label></td>
                      <td> <asp:TextBox ID="txtObservacion" runat="server" onkeyup="javascript:this.value=this.value.toUpperCase();"  disabled ></asp:TextBox></td>
                  </tr>
                 

              <asp:Label class="alert alert-danger" ID="txtAlerta" runat="server" Text="" width="517px"></asp:Label>
              <asp:Label class="alert alert-success" ID="txtCorrecto" runat="server" Text="" width="517px"></asp:Label>
              </table>


             <div class="form-actions">
                  
                <asp:Button ID="btnInsertar"  class="btn btn-success" runat="server" Text="Insertar" OnClick="btnInsertar_Click1" />
                <asp:Button ID="btnActualizar"  class="btn btn-success" runat="server" Text="Actualizar" OnClick="btnActualizar_Click1" />
                <asp:Button ID="btnEliminar"  class="btn btn-danger" runat="server" Text="Eliminar" OnClick="btnEliminar_Click1" />
                <asp:Button ID="btnCancelar"  class="btn btn-success" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
              </div>
          </div>
        </div>
      </div>

        <div class="span6"  style="width:662px;">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
            <h5>Registro de Notas</h5>
          </div>
          <div class="widget-content nopadding">
              <asp:GridView  class="grid" ID="gwRegistro" runat="server"
                    AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="gwRegistro_SelectedIndexChanged" OnPageIndexChanging="gwRegistro_PageIndexChanging" PageSize="7" >
                        <Columns>
                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                        </Columns>
                        <RowStyle Font-Size="7pt" />
               </asp:GridView>

             
          </div>
        </div>
      </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
