<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="form_Alumno.aspx.cs" Inherits="SisMatricula_cSharp_v2.form_Alumno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="span6">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class=" icon-pencil"></i> </span>
            <h5>MANTENIMINETO - ALUMNO</h5>
          </div>
          <div class="widget-content nopadding">

              <table style="width: 100%;" id="contenedor_cajas">
                 
                  <tr>
                      <td id="texto_label"><asp:Label ID="Label1" runat="server" Text="Id : "></asp:Label></td>
                      <td> <asp:TextBox ID="txtId" runat="server" onkeyup="javascript:this.value=this.value.toUpperCase();" disabled ></asp:TextBox></td>
                  </tr>
                  <tr>
                      <td id="texto_label"><asp:Label ID="Label2" runat="server" Text="Descripcion : "></asp:Label></td>
                      <td> <asp:TextBox ID="txtNombre" runat="server" onkeyup="javascript:this.value=this.value.toUpperCase();"  ></asp:TextBox></td>
                  </tr>
                  <tr>
                      <td id="texto_label"><asp:Label ID="Label3" runat="server" Text="Apellido : "></asp:Label></td>
                      <td> <asp:TextBox ID="txtApellido" runat="server" onkeyup="javascript:this.value=this.value.toUpperCase();"  ></asp:TextBox></td>
                  </tr>
                  <tr>
                      <td id="texto_label"><asp:Label ID="Label4" runat="server" Text="Direccion : "></asp:Label></td>
                      <td> <asp:TextBox ID="txtDireccion" runat="server" onkeyup="javascript:this.value=this.value.toUpperCase();"  ></asp:TextBox></td>
                  </tr>
                     <tr>
                      <td id="texto_label"><asp:Label ID="Label5" runat="server" Text="Carrera : "></asp:Label></td>
                      <td>
                          <asp:DropDownList ID="droCarrera" runat="server"></asp:DropDownList> </td>
                  </tr>

                   <tr>
                      <td id="texto_label"><asp:Label ID="Label6" runat="server" Text="Semestre : "></asp:Label></td>
                      <td>
                          <asp:DropDownList ID="droSemestre" runat="server"></asp:DropDownList> </td>
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

        <div class="span6">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
            <h5>Carreras</h5>
          </div>
          <div class="widget-content nopadding">
              <asp:GridView  class="grid" ID="gwAlumno" runat="server"
                    AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="gwAlumno_SelectedIndexChanged" OnPageIndexChanging="gwAlumno_PageIndexChanging" PageSize="12" >
                        <Columns>
                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                        </Columns>
               </asp:GridView>

             
          </div>
        </div>
      </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
